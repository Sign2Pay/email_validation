# Email Validation

[ ![Codeship Status for Sign2Pay/email_validation](https://codeship.com/projects/cff99ba0-fbcf-0132-4de4-1658e61aa1b1/status?branch=master)](https://codeship.com/projects/87271)

This straightforward Ruby class will connect to [Mailgun's Email Validation Service](https://documentation.mailgun.com/api-email-validation.html#email-validation) and tell you if the provided email is valid or not.

## Configuration

Configure your Mailgun public key:

```
EmailValidation.configure do |config|
  config.mailgun_public_key = 'pubkey-5ogiflzbnjrljiky49qxsiozqef5jxp7'
end
```

## Use instructions

```
EmailValidation::Validate.new("eg@gmail.com").valid? # => false
```

or do it in two steps if that's more your style:

```
validation = EmailValidation::Validate.new("eg@gmail.com")
validation.valid? # => false
```

## Background Job

I suggest you create a background job to check email validity. You don't really want to depend on Mailgun being online in order to register a new user. A possible solution using a boolean field on User is this:

```
require 'email_validation/validate'

class EmailValidationJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.update email_valid: email_valid(user.email)
  end

  private

  def email_valid(email)
    EmailValidation::Validate.new(email).valid?
  end
end
```

You can then ask the user to change their email.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'email_validation'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_validation

## Development

```
rake test
```

## Contributing

[Open an issue](https://github.com/Sign2Pay/email_validation/issues) or submit a pull request. We'll work it out!

## Copyright

Copyright Sign2Pay NV. Licensed using the MIT license.
