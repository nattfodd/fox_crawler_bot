module TelegramNotifier
  module Listeners
    class Help < Base

      COMMAND = /помощь|help|справка/i

      def perform
        API.send_message(user_id,
          "Основные команды со мной: \n"\
          "\t*следи за|подписка* <ссылка на сайт с фильтрами объявлений> - подписаться на рассылку новых объявлений\n"\
          "\t*стоп|прекращай|отпишись|прекрати|харэ* - отписаться от всех рассылок\n"\
          "\t*ping* - проверяем, что я жив и не упал\n"\
          "\t*мои подписки|подписки* - список твоих подписок\n"\
          "\t/listofsites - список подерживаемых сайтов\n"\
          "\t/help - показ справки\n"\
          "\t/about - контакты автора",
          parse_mode: 'Markdown'
        )
        true
      end
    end
  end
end
