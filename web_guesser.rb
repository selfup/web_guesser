require 'json'
require 'sinatra'
require "sinatra/json"
require 'sinatra/reloader'

get '/' do
	erb :index
end

get '/api/v1/some_data.json' do
  json({ :key1 => 'value1', :key2 => 'value2' })
end
