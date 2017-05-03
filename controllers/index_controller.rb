module WebGuesser
  class Server < Sinatra::Base
		def js_bundle
			if ENV['SINATRA_ENV'] == "production"
				"prod/bundle.js"
			else
				"http://localhost:8080/bundle.js"
			end
		end

		get '/' do
			erb :index, locals: {
				page_name: 'Welcome to ajax land!',
				script: js_bundle,
			}
		end

		get '/api/v1/some_data.json' do
      content_type :json
		  { :key1 => 'value1', :key2 => 'value2' }.to_json
		end
	end
end
