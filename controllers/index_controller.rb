def prod_path(options)
  if ENV['SINATRA_ENV'] == "production"
    "/sinatra" # set to whatever route you are using in proxy pass
  else
    options[:api] ? "" : "/"
  end
end

module WebGuesser
  class Server < Sinatra::Base
    SOME_DATA_ENDPOINT = "#{prod_path({ api: true})}/api/v1/some_data.json"

		def js_bundle
			if ENV['SINATRA_ENV'] == "production"
				"prod/bundle.js"
			else
				"http://localhost:8080/bundle.js"
			end
		end

		get "#{prod_path({ api: false})}" do
			erb :index, locals: {
				page_name: 'Welcome to ajax land!',
				script: js_bundle,
        some_data_endpoint: SOME_DATA_ENDPOINT,
			}
		end

		get SOME_DATA_ENDPOINT do
      content_type :json
		  { :key1 => 'value1', :key2 => 'value2' }.to_json
		end
	end
end
