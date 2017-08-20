module TelegramNotifier
  module Crawlers
    class Ria < Base
      def applies?
        base_url =~ /auto\.ria\.com/
      end

      def collect_ads
        super do |page, agent|
          # Not yet implemented
          []
        end
      end
    end
  end
end
