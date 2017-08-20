require 'sinatra'
require 'sinatra/reloader'

tg_config = YAML.load_file("#{TelegramNotifier.root}/config/telegram.yml")

API.register_webhook()

# Server Telegram webhooks to get notified about new messages sent to bot
# TODO: replace with :post
post "/#{tg_config['token'].split(':').last}" do
  puts 'WebHook'
end
