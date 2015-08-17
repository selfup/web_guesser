require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def number
	SECRET_NUMBER
end

def check_guess(guess)
	guess = guess.to_i
	too_high = number + 5
	too_low = number - 5
	if guess == number
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

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end
