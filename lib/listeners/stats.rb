module TelegramNotifier
  module Listeners
    class Stats < Base

      COMMAND = /stats\!|статистика/i

      def perform
        return unless user_id.to_i == 105873179

        subscriptions = Repositories::Subscriptions.get_subscriptions
        messages =
          [
            "Количество подписок: #{subscriptions.count}",
            "Ботом пользуется: #{subscriptions.map(&:users_ids).uniq.count} человек",
            ''
          ]
        subscriptions.each do |subscription|
          messages << "На подписку ниже подписаны юзеры: #{subscription.users_ids}"
          messages << subscription.url
          messages << "(всего сохранено объявлений: #{subscription.ads_links.count})"
        end

        API.send_message(user_id, messages.join("\n"), disable_web_page_preview: true)

        true
      end
    end
  end
end
