include AssetBundleModule

module WebGuesser
  class Server < Sinatra::Base
    NUMBERS = "/sinatra/api/v1/numbers.json"
    UPDATE_NUMBER_ONE = "/sinatra/api/v1/update_number_one.json"

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
        numbers: NUMBERS,
        update_number_one: UPDATE_NUMBER_ONE,
			}
		end

    post UPDATE_NUMBER_ONE do
      content_type :json
      up_down = { "up" => 1, "down" => -1 }
      direction = request.params["direction"]
      GlobalState[:number_one] = GlobalState[:number_one] + up_down[direction]

      res = { first_number: GlobalState[:number_one] }
      res.to_json
    end

		get NUMBERS do
      content_type :json
      res = { first_number: GlobalState[:number_one] }
      res.to_json
		end
	end
end
