module EmailValidation
  # This class validates the email that is given to the initializer.
  class Validate

    def initialize(email)
      @email = email
    end

    def valid?
      connection.get "/v3/address/validate?address=#{@email}"
    end

    private

    def connection
      Faraday.new url: "https://api.mailgun.net" do |faraday|
        faraday.use Faraday::Request::BasicAuthentication, 'api', EmailValidation.configuration.mailgun_public_key
        faraday.request :json
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

  end
end
