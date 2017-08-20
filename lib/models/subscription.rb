module TelegramNotifier
  module Models
    class Subscription
      include Mongoid::Document
      include Mongoid::Timestamps

      field :url,       type: String
      field :users_ids, type: Array
      field :ads_links, type: Array, default: []

      index({ url: 1 }, { unique: true })
      index({ users_ids: 1 })
    end
  end
end
