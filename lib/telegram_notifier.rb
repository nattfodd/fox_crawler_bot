require 'pry'

module TelegramNotifier
  def self.root
    Pathname.new(__FILE__).dirname.parent.expand_path
  end

  def self.require_libs(base_dir)
    lib_path = "#{self.root}/lib/#{base_dir}"

    # Sort importer directories to avoid glob sorting issues.
    Dir["#{lib_path}/*"].sort.each do |dir|
      require dir
    end
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
require_relative 'workers/notifier'
require_relative 'models/subscription'
require_relative 'repositories/subscriptions'
require_relative 'initializers/mongoid'

TelegramNotifier.require_libs('crawlers')
TelegramNotifier.require_libs('listeners')
