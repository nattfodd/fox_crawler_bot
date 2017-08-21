module TelegramNotifier
  module Crawlers
    class Ria < Base

      SITE_REGEXP = /auto\.ria\.com/
      SITE_URL    = 'https://auto.ria.com'

      enabled false

      # https://developers.ria.com/auto/info?api_key=glv2fgC6BeGy60wPGerpw1g4YbJYz7MEIlvjjvRx&auto_id=20310691
      # https://developers.ria.com/auto/search?api_key=glv2fgC6BeGy60wPGerpw1g4YbJYz7MEIlvjjvRx&category_id=1&with_photo=1&s_yers[0]=2006&price_ot=7000&price_do=9000&currency=1&state[7]=7&gear=2,3,4,5
      def collect_ads
        super do |page, agent|
          # Not yet implemented
          []
        end
      end
    end
  end
end
