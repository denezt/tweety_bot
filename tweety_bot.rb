#!/usr/bin/env ruby
# Created By:	Richard L. Jackson
# Date:		2016-08-31
# Purpose:	Scan, Write, Analyze Twitter Feeds.
##

require 'twitter'

client = Twitter::REST::Client.new do |config|
	config.consumer_key = ""
	config.consumer_secret = ""
	config.access_token = ""
	config.access_token_secret = ""
end

#
puts "\033[43m------\033[0m"

client.search("#science").take(100).each do |tweet|
	puts tweet.text
end
