module TelegramNotifier
  module Crawlers
    class Rst < Base

      SITE_REGEXP = /rst\.ua/
      SITE_URL    = 'http://rst.ua'

      def collect_ads
        super do |page, agent|
          actual_links = page.links.select { |l| l.text =~ /\Aпродам/ }

          host = "http://#{page.uri.host}"
          actual_links.map do |link|
            "#{host}#{link.href}"
          end
        end
      end
    end
  end
end
