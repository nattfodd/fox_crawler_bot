require 'daemons'
require 'pathname'

root = Pathname.new(__FILE__).dirname.parent.expand_path
Daemons.run("#{root}/bin/long_polling.rb")
