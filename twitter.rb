require 'hue'
require 'pry'
require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = ENV[‘TWITTER_CONSUMER_KEY’]
  config.consumer_secret    = ENV[‘TWITTER_CONSUMER_SECRET’]
  config.oauth_token        = ENV[‘TWITTER_OAUTH_TOKEN’]
  config.oauth_token_secret = ENV[‘TWITTER_OAUTH_SECRET’]
  config.auth_method        = :oauth
end



# client = TweetStream::Client.new

# client.userstream do |status|
#   puts status.text
#   client = Hue::Client.new
# 	light = client.lights.last
# 	light.on = false
# 	light.set_state({:hue => 0, :alert => "select"})
# 	light.on = false
# end

TweetStream::Client.new.track("rihanna") do |status|
  puts "#{status.text}"
  client = Hue::Client.new
	client.lights[0..6].each do |i| 
    i.set_state({:hue => 0, :alert => "select"})
    i.on = false
  end
end

