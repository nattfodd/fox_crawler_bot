module TelegramNotifier
  module Crawlers
    class Rst < Base
      def applies?
        base_url =~ /rst\.ua/
      end

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
