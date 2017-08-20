require 'bundler/setup'

require_relative 'lib/telegram_notifier'
require_relative 'bin/webserver'

run Sinatra::Application
