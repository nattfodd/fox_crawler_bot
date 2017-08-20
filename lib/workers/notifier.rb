module TelegramNotifier
  module Workers
    class Notifier

      def self.perform
        Repositories::Subscriptions.get_subscriptions.each do |subscription|
          urls = Crawler.collect_ads(subscription.url)
          saved_ads_links = subscription.ads_links
          new_links = urls.select { |u| !saved_ads_links.include?(u) }
          next if new_links.empty?

          subscription.push(ads_links: new_links)

          subscription.users_ids.each do |user_id|
            API.send_message(user_id, "Новые объявления к этому часу: ")
            new_links.each { |url| API.send_message(user_id, url) }
          end
        end
      end

    end
  end
end
