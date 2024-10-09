# eodhd.rb

## Description

Access the eodhd.com API with Ruby.

## Installation

Add this line to your application's Gemfile:
```ruby
  gem 'eodhd.rb'
```
And then execute:
```bash
  $ bundle
```
Or install it yourself as:
```bash
  $ gem install eodhd.rb
```

## Usage

### Setup
```ruby
api_token = 'api_token'
eodhd_api ||= Eodhd.new(api_token: api_token)
```

### List of Exchanges
```ruby
eodhd_api.exchanges
```

### List of Exchange Symbols
```ruby
exchange = eodhd_api.exchanges.first

eod_api.exchange_symbols(exchange: exchange)
# OR
eod_api.exchange_symbols(exchange_code: exchange.code)
```

### Retrieve EOD Data For One Symbol
```ruby
exchange = eodhd_api.exchanges.first
exchange_symbol = eod_api.exchange_symbols(exchange: exchange).first

eod_api.eod_data(exchange: exchange, exchange_symbol: exchange_symbol)
# OR
eod_api.eod_data(exchange_code: exchange.code, exchange_symbol: exchange_symbol)
# OR
eod_api.eod_data(exchange: exchange, symbol: exchange_symbol.code)
# OR
eod_api.eod_data(exchange_code: exchange.code, symbol: exchange_symbol.code)
```

### Retrieve EOD Data For Multiple Symbols For One Date
```ruby
exchange = eodhd_api.exchanges.first

eod_api.eod_bulk_last_day(exchange: exchange, date: Date.today)
# OR
eod_api.eod_bulk_last_day(exchange_code: exchange.code, date: Date.today)
```

## Contributing

1. Fork it ( https://github.com/thoran/eodhd.rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request
