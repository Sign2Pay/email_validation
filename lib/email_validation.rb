require 'faraday'
require 'faraday_middleware'

require 'email_validation/version'
require 'email_validation/configuration'
require 'email_validation/validate'

module EmailValidation

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

end
