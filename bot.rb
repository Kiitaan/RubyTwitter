#!/usr/bin/env ruby

require 'Twitter'
require 'json'

file = File.read("private.json")

hashkeys = JSON.parse(file)

client = Twitter::REST::Client.new(hashkeys["config"])


end

search_options = {
  result_type: "recent",
  geocode: "48.8566140,2.3522220,10mi"
}

client.search("#kebab", search_options).take(50).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
 client.favorite(tweet)
 client.retweet(tweet)
 client.update("Hello, tu peux manger pas cher
   au kebab du coin")
end
