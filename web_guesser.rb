require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def number
	SECRET_NUMBER
end

def check_guess(guess)
	guess = guess.to_i unless guess.nil?
	too_high = number + 5
	too_low = number - 5
	if guess.nil?
		"Take a guess!"
	elsif
		guess == number
		"You got it right!
		The SECRET NUMBER is: <strong>#{number}</strong>"
	elsif guess >= too_high
		"Way too high!"
	elsif guess <= too_low
		"Way too low!"
	elsif guess > number
		"Too high!"
	elsif guess < number
		"Too low!"
	else
		""
	end
end

def color_guess
	if @@message == "Way too low!" || @@message == "Way too high!"
		"background-color:#F0501A"
	elsif @@message == "Too low!" || @@message == "Too high!"
		"background-color:#D4A190"
	elsif @@message.start_with?("You") 
	  "background-color:#A1D490"
	else
		"background-color:#90C3D4"
	end
end

get '/' do
	guess = params["guess"]
	@@message = check_guess(guess)
	erb :index, :locals => {
			:number => SECRET_NUMBER,
		  :message => @@message,
		  :color_guess => color_guess
		}
end
