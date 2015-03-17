#!/bin/bash
#

source ~/.rvm/scripts/rvm
rvm requirements
rvm install $*
echo "gem: --no-document" > ~/.gemrc
gem install rails
