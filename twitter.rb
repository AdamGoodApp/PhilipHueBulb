require 'hue'
require 'pry'
require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = "bImywraQHjRNo1YF7oTtg"
  config.consumer_secret    = "BHTkRR8KWswRLQjLNf9u6kSZXWv1Kaz5MTV4StXib4"
  config.oauth_token        = "1442146753-hyciZqbBKhbpYa2kG5cmH07eoxwvAaT1CF0DuAt"
  config.oauth_token_secret = "8m8gbARgRVfZCJggTmRdYRS4qGIMgwDGwoHq9ptdaM8bb"
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

