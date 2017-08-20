module TelegramNotifier
  module Crawlers
    class Base
      attr_reader :base_url

      def applies?
        # Base class is for inheritance only
        false
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
