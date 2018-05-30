# Hubspot2

A ruby wrapper for Hubspot REST APIs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hubspot2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hubspot2

## Usage

Create an initializer to setup hubspot API key
```
Hubspot.configure do |config|
  config.hapikey = ENV['HUBSPOT_HAPIKEY']
  config.request_timeout_in_seconds = 30
end
```

Important note: as hubspot doesn't support testing/staging environments, please not setting the `hapikey` for test and staging environment if you don't want your production data gets messed up with testing data.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MQuy/hubspot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

