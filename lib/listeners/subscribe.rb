module TelegramNotifier
  module Listeners
    class Subscribe < Base

      COMMAND = /следи\s+за|подписка/i

      def perform
        url = message[/#{COMMAND}\s*(?<url>https?\:\/\/[\w\W]+)\Z/, :url]
        return unless url && url =~ URI::regexp

        subscription = Repositories::Subscriptions
          .add_subscriber(user_id: user_id, url: url)
        API.send_message(user_id,
          'Вы успешно подписались на рассылку. '\
          'Несколько раз в день я буду проверять для тебя эту ссылку, '\
          'и оповещать, если появятся новые объявления.')

        if subscription.just_created?
          new_links = Crawler.collect_ads(url).compact.uniq
          subscription.ads_links = new_links
          subscription.save
          msg = "Ты первый, кто смотрит объявления по этому запросу! "
          if new_links.any?
            msg << "Сохранил себе #{new_links.count} объявлений. "\
              "О любых новых объявлениях по этой ссылке жди от меня вестей "\
              "как только так сразу!"
          else
            msg << "Объявлений на данный момент нет, но как только появятся - я тебе сообщу!"
          end

          API.send_message(user_id, msg)
        end

        true
      end
    end
  end
end
