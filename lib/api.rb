module TelegramNotifier
  class API

    API_URL = 'https://api.telegram.org/bot'

    class << self
      # https://api.telegram.org/bot390375186:AAFyJId3y7mRqL9OUsIPrBS57_tkPnNLXg4/
      # sendMessage?chat_id=105873179&text=%22Hello!%22
      def send_message(user_id, message)
        url = "#{API_URL}#{__config__['token']}/sendMessage"
        __connection__.post(url, { chat_id: user_id, text: message })
      end

      def register_webhook
        # TODO
      end

      def get_updates(params = {})
        url = "#{API_URL}#{__config__['token']}/getUpdates"
        __connection__.post(url, params)
      end

      def __connection__
        @@connection ||= Faraday.new(url: API_URL)
      end

      def __config__
        @config ||= YAML.load_file("#{TelegramNotifier.root}/config/telegram.yml")
      end
    end
  end
end
