module TelegramNotifier
  module Listeners
    class Start < Base

      COMMAND = /\/start/i

      def perform
        API.send_message(user_id,
          'Привет! Я Лис! Я не бит и не крашен 🙈. '\
          'Я помогу тебе следить за новыми объявлениями по продаже автомобилей.')
        Help.new(user_id: user_id, message: message).perform
      end
    end
  end
end
