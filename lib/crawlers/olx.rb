module TelegramNotifier
  module Crawlers
    class Olx < Base

      SITE_REGEXP = /olx\.ua/
      SITE_URL    = 'http://olx.ua'

      def collect_ads
        super do |page, agent|
          actual_links = page.links.select { |l| l.href =~ /\/obyavlenie\// }
          actual_links.map(&:href).uniq
        end
      end
    end
  end
end
