module TelegramNotifier
  class Listener

    def self.listen
      offset = 0
      loop do
        response = TelegramNotifier::API.get_updates({ offset: offset, allowed_updated: [ 'message '] })
        if response
          body = JSON.parse(response.body)['result']
          body.each do |update|
            message = update['message']
            offset  = update['update_id'] + 1

            begin
              klasses =
                TelegramNotifier::Listeners.constants.map do |klass_name|
                  full_klass_name = "TelegramNotifier::Listeners::#{klass_name.to_s}"
                  Object.const_get(full_klass_name)
                end

              message_text = message['text']
              user_id      = message['from']['id']

              performer =
                klasses.find do |klass|
                  obj = klass.new(user_id: user_id, message: message_text)
                  next unless obj.applies?

                  obj.perform
                end
              next if performer

              TelegramNotifier::API.send_message(user_id, 'Я не знаю такой команды. Напиши /help для справки')
            rescue => err
              begin
                TelegramNotifier::API.send_message('105873179',
                  "Тут случилась какая-то фигня в процессе работы:\n"\
                  "Пришло от Telegram: #{response}\n"\
                  "Вывалилась ошибка: #{err}")
              rescue => e
                # something really unexpected
              end
            end
          end
        end
      end
    end

  end
end
