require 'test_helper'

class TestEmailValidation < Minitest::Test

  def test_version
    assert EmailValidation::VERSION
  end

  def test_valid_email
    stub_request(:get, /api\.mailgun\.net/).to_return(valid_response)
    assert_equal true, EmailValidation::Validate.new("valid@gmail.com").valid?
  end

  def test_invalid_email
    stub_request(:get, /api\.mailgun\.net/).to_return(invalid_response)
    assert_equal false, EmailValidation::Validate.new("eg@gmail.com").valid?
  end

  def valid_response
    File.new(File.dirname(__FILE__) + '/valid_response.txt')
  end

  def invalid_response
    File.new(File.dirname(__FILE__) + '/invalid_response.txt')
  end

end
