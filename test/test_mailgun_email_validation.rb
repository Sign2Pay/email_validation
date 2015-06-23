class TestMailgunEmailValidation < Minitest::Test

  def test_version
    assert MailgunEmailValidation::VERSION
  end

  def test_valid_email
    assert MailgunEmailValidation.new("valid@gmail.com").valid?
  end

end
