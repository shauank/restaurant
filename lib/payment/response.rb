module Payment
  class Response
    attr_reader :gateway_response

    def initialize(gateway_response)
      @gateway_response = gateway_response
    end
  end
end
