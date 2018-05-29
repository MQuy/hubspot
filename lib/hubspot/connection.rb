module Hubspot
  module Connection
    extend self

    API_URL = "https://api.hubapi.com".freeze
    DEFAULT_TIMEOUT_IN_SECONDS = 30

    def post(path, params = {})
      response = request(API_URL + path, :post, params)
      handle(response)
    end

    def get(path)
      response = request(API_URL + path, :get)
      handle(response)
    end

    private

    def request(endpoint, method, params = {})
      Typhoeus.send(method,
                    "#{endpoint}?hapikey=#{Config.hapikey}",
                    timeout: Config.request_timeout_in_seconds || DEFAULT_TIMEOUT_IN_SECONDS,
                    body: params.to_json,
                    headers: {
                      "Content-Type" => "application/json"
                    }
      )
    end

    def handle(response)
      if response.success?
        response
      else
        raise(ApiError.new(response))
      end
    end
  end
end
