require 'email_validation'
require 'minitest/autorun'
require 'webmock/minitest'

EmailValidation.configure do |config|
  config.mailgun_public_key = 'pubkey-5ogiflzbnjrljiky49qxsiozqef5jxp7'
end
