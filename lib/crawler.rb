module TelegramNotifier
  class Crawler
    def self.collect_ads(url)
      crawlers_classes.each do |klass|
        obj = klass.new(url)
        next unless obj.applies?

        return obj.collect_ads
      end
    end

    def self.crawlers_classes
      TelegramNotifier::Crawlers.constants.map do |klass_name|
        full_klass_name = "TelegramNotifier::Crawlers::#{klass_name.to_s}"
        klass = Object.const_get(full_klass_name)
        klass if klass.enabled?
      end.compact
    end
  end
end
