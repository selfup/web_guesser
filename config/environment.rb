# require your gems
require 'bundler'
require 'json'

Bundler.require

# set the pathname for the root of the app
require 'pathname'
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

# require the controller(s)
Dir[APP_ROOT.join('controllers', '*.rb')].each { |file| require file }

# configure Server settings
module WebGuesser
  GlobalState = {}
  GlobalState[:number_one] = 0
  GlobalState[:number_two] = 5

  class Server < Sinatra::Base
    set :method_override, true
    set :root, APP_ROOT.to_path
    set :views, File.join(WebGuesser::Server.root, "views")
    set :public_folder, File.join(WebGuesser::Server.root, "public")
  end
end