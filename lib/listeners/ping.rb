module TelegramNotifier
  module Listeners
    class Ping < Base

      COMMAND = /ping|пинг/i

      def perform
        API.send_message(user_id, "Понг, епте. Я жив-здоров, спасибо что интересуешься 😊")
        true
      end
    end
  end
end
