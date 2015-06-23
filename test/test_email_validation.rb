require 'test_helper'

class TestEmailValidation < Minitest::Test

  def test_version
    assert EmailValidation::VERSION
  end

  def test_valid_email
    assert EmailValidation::Validate.new("valid@gmail.com").valid?
  end

end
