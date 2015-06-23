module EmailValidation
  class Configuration

    attr_accessor :mailgun_public_key

    def initialize
      @mailgun_public_key = ''
    end

  end
end
