module Hubspot
  class ApiError < StandardError

    def initialize(response)
      json_response = JSON.parse(response.body)
      super(json_response["message"])
    end
  end
end
