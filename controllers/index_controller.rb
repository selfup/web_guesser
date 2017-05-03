include AssetBundleModule

module WebGuesser
  class Server < Sinatra::Base
    SOME_DATA_ENDPOINT = "/sinatra/api/v1/some_data.json"

    get "/" do
      erb :dom_events, locals: {
        css: css_bundle,
      }
    end

		get "/sinatra" do
			erb :example_ajax, locals: {
				page_name: 'Welcome to ajax land!',
				script: js_bundle,
        css: css_bundle,
        some_data_endpoint: SOME_DATA_ENDPOINT,
			}
		end

		get SOME_DATA_ENDPOINT do
      content_type :json
		  { :key1 => 'value1', :key2 => 'value2' }.to_json
		end
	end
end
