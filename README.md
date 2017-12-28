# EWayClient

[![Build Status](https://travis-ci.org/bloom-solutions/e_way_client-ruby.svg?branch=master)](https://travis-ci.org/bloom-solutions/e_way_client-ruby)

Ruby wrapper for EWay.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'e_way_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install e_way_client

## Usage

You may set global settings in an initializer:

```ruby
EWayClient.configure do |c|
  c.username = ENV["E_WAY_USERNAME"]
  c.password = ENV["E_WAY_PASSWORD"]
  c.secret = ENV["E_WAY_SECRET"]
end
```

Whenever you call `EWayClient.new` it will use the global settings unless you provide it, like `EWayClient.new(password: "password")`

See detailed usage examples in `spec/acceptance`.

### Factories

To aid development in your apps, you may include FactoryBot factories of the models by calling `require "e_way_client/factories"`.

## Development

- Copy `spec/config.yml.sample` to `spec/config.yml`
- Replace values with your test credentials

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/bloom-solutions/e_way_client-ruby). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

