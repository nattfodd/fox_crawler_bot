#!/bin/bash

eval "clockworkd -c bin/clockwork.rb stop"
eval "bundle exec ruby bin/listener.rb stop"
sleep 2

eval "clockworkd -c bin/clockwork.rb start"
eval "bundle exec ruby bin/listener.rb start"

eval "clockworkd -c bin/clockwork.rb status"
eval "bundle exec ruby bin/listener.rb status"

exit 0
