module TelegramNotifier
  module Listeners
    class Subscribe < Base

      COMMAND = /следи\s+за|подписка/i

      def perform
        url = message[/#{COMMAND}\s*(?<url>https?\:\/\/[\w\W]+)\Z/, :url]
        return unless url && url =~ URI::regexp

        Repositories::Subscriptions
          .add_subscriber(user_id: user_id, url: url)
        API.send_message(user_id,
          'Вы успешно подписались на рассылку. '\
          'Несколько раз в день я буду проверять для тебя эту ссылку, '\
          'и оповещать, если появятся новые объявления.')
        true
      end
    end
  end
end
