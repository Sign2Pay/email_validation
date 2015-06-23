# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'email_validation/version'

Gem::Specification.new do |spec|
  spec.name          = "email_validation"
  spec.version       = EmailValidation::VERSION
  spec.authors       = ["Joost Baaij"]
  spec.email         = ["joost@spacebabies.nl"]

  spec.summary       = %q{Ruby class to validate email addresses}
  spec.homepage      = "https://github.com/Sign2Pay/email_validation"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.9.0"

  spec.add_dependency "faraday", "~> 0.9.1"
  spec.add_dependency "faraday_middleware", "~> 0.9.1"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webmock"
end
