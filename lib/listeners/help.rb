module TelegramNotifier
  module Listeners
    class Help < Base

      COMMAND = /помощь|\/help|справка/i

      def perform
        API.send_message(user_id,
          "Основные команды со мной: \n"\
          "\t(/help) - показ справки\n"\
          "\t(следи за|подписка) <ссылка на RST.ua с фильтрами авто> - подписаться на рассылку новых объявлений\n"\
          "\t(стоп|прекращай|отпишись|прекрати|харэ) - отписаться от всех рассылок"
        )
        true
      end
    end
  end
end
