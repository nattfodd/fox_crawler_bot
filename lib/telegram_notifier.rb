require 'pry'

module TelegramNotifier
  def self.root
    Pathname.new(__FILE__).dirname.parent.expand_path
  end
end

require 'mechanize'
require 'clockwork'
require 'mongoid'
require 'telegram/bot'
require 'faraday'

require_relative 'api'
require_relative 'crawler'
require_relative 'listener'

require_relative 'crawlers/base'
require_relative 'crawlers/rst'

require_relative 'listeners/base'
require_relative 'listeners/help'
require_relative 'listeners/subscribe'
require_relative 'listeners/unsubscribe'

require_relative 'workers/notifier'

require_relative 'models/subscription'
require_relative 'repositories/subscriptions'

require_relative 'initializers/mongoid'

