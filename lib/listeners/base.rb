module TelegramNotifier
  module Listeners
    class Base

      attr_accessor :user_id,
                    :message

      def applies?
        return false if self.class == TelegramNotifier::Listeners::Base

        message =~ self.class::COMMAND
      end

      def initialize(user_id:, message:)
        @user_id = user_id
        @message = message
      end

    end
  end
end
