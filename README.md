# Mailgun Email Validation

This straightforward Ruby class will connect to [Mailgun's Email Validation Service] and tell you if the provided email is valid or not.

## Use instructions

```
MailgunEmailValidation.new("eg@gmail.com").valid? # => false
```

or do it in two steps if that's more your style:

```
validation = MailgunEmailValidation.new("eg@gmail.com")
validation.valid? # => false
```

## Background Job

Normally I sugges you create a background job to check email validity. You don't really want to be depent on Mailgun being online in order to be able to register a new user. A possible solution using a boolean field on User is this:

```
require 'mailgun_email_validation'

class EmailValidationJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.update email_valid: email_valid(user.email)
  end

  private

  def email_valid(email)
    MailgunEmailValidation.new(email).valid?
  end
end
```

You can then ask the user to change their email.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mailgun_email_validation'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mailgun_email_validation

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

[Open an issue](https://github.com/Sign2Pay/mailgun_email_validation/issues) or submit a pull request. We'll work it out!

## Copyright

Copyright Sign2Pay NV. Licensed using the MIT license.
