module TelegramNotifier
  module Listeners
    class SupportedServices < Base

      COMMAND = /сайты|возможности|\/listofsites/i

      def perform
        list_of_sites =
          Crawler.crawlers_classes.map do |klass|
            "🔍 #{klass::SITE_URL}" if klass::SITE_URL
          end.compact

        API.send_message(user_id, "Я поддерживаю следующие сайты:")
        API.send_message(user_id, list_of_sites.join("\n"), disable_web_page_preview: true)

        true
      end
    end
  end
end
