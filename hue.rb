require 'hue'
require 'pry'
require 'twitter'

# Twitter.configure do |config|
# 	  config.consumer_key = "bImywraQHjRNo1YF7oTtg"
# 	  config.consumer_secret = "BHTkRR8KWswRLQjLNf9u6kSZXWv1Kaz5MTV4StXib4"
# 	  config.oauth_token = "1442146753-hyciZqbBKhbpYa2kG5cmH07eoxwvAaT1CF0DuAt"
# 	  config.oauth_token_secret = "8m8gbARgRVfZCJggTmRdYRS4qGIMgwDGwoHq9ptdaM8bb"
# end




# while true == true

# 	a = Twitter.user_timeline("adamgoodapp")
# 	twitter = a[1]
# 	tweets = twitter.user.statuses_count

# 	while true == true do

# 		b = Twitter.user_timeline("adamgoodapp")
# 		twitterb = b[1]
# 		tweetsb = twitterb.user.statuses_count
		
# 		if tweets != tweetsb
# 			puts "YAAAAY"
# 			break if true == true
# 		end

# 	end
	
# end

# binding.pry


client = Hue::Client.new
light = client.lights.last
light.on = false

puts "Welcome to HUE"
puts "Enter all to turn all lights on"
puts "Enter one to turn one light on"

input = gets.chomp

if input == "all"
	client.lights[0..6].each do |i| i.on = true end
	light = client.lights.last
else
	light.on = true
end

puts "lets play a game, green light for correct answer, red for wrong"

puts "2x2 = ?"

input_a = gets.chomp

correct = (1..2)

while input_a != "4" do
	correct.each do |i|
		light.set_state({:hue => 0, :alert => "select"})
	end
	puts "wrong answer, please try again"
	
	input_a = gets.chomp
end

correct.each do |i|
	light.set_state({:hue => 25500, :alert => "select"})
end

puts "Yay, well done that is correct"

puts "Good Bye"

client.lights[0..6].each do |i| i.on = false end




