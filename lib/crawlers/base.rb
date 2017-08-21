module TelegramNotifier
  module Crawlers
    class Base
      attr_reader :base_url

      # Base class is for inheritance only
      SITE_REGEXP = nil
      SITE_URL    = nil

      class << self
        def enabled(flag = nil)
          @enabled = flag
        end

        def enabled?
          @enabled.nil? ? true : @enabled
        end
      end

      def applies?
        self.class.enabled? &&
          ( self.class::SITE_REGEXP && base_url =~ self.class::SITE_REGEXP)
      end

      def initialize(url)
        @base_url = url
      end

      def collect_ads
        agent = Mechanize.new

        agent.user_agent_alias = 'Mac Safari'
        page = agent.get(base_url)
        result = yield page, agent

        result
      end
    end
  end
end
