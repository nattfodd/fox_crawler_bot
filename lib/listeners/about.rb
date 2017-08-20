require_relative './base'

module TelegramNotifier
  module Listeners
    class About < Base

      COMMAND = /\/about/i

      def perform
        API.send_message(user_id, "По всем вопросам пишите сюда: telegram.me/nattf0dd")
        true
      end
    end
  end
end
