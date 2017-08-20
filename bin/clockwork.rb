require_relative '../lib/telegram_notifier'

include Clockwork

every(1.minute, 'Inspecting new ads') { TelegramNotifier::Workers::Notifier.perform }
