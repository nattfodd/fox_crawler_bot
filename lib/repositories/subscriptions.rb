module TelegramNotifier
  module Repositories
    class Subscriptions

      class << self
        def get_subscriptions(user_id = nil)
          result = Models::Subscription.all
          return result unless user_id

          result.where(users_ids: { '$in' => [ user_id ] })
        end

        def add_subscriber(url:, user_id:)
          subscription = Models::Subscription.where(url: url).first
          if subscription
            users_ids = subscription.users_ids + [ user_id ]
            subscription.users_ids = users_ids.compact.uniq
            subscription.save
          else
            Models::Subscription.create(url: url, users_ids: [ user_id ])
          end
        end

        def remove_subscriber(user_id)
          subscriptions = Models::Subscription.where(users_ids: { '$in' => [ user_id ] })
          subscriptions.each do |s|
            s.pull_all(users_ids: [ user_id ])
            s.delete if s.users_ids.empty?
          end
        end

        def save_new_results(url, user_id, ads_links)
          subscription = Models::Subscription.where(url: url).first
          if subscription
            ads_links = (subscription.ads_links + ads_links).compact.uniq
            subscription.ads_links = ads_links
            subscription.save
          else
            Models::Subscription.create(
              url:       url,
              users_ids: [ user_id ],
              ads_links: ads_links.compact.uniq
            )
          end
        end
      end
    end
  end
end
