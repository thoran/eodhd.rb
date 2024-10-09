# Eodhd.rb
# Eodhd

# 20241009
# 0.13.4

# Changes since 0.12:
# -/0: Add logging.
# 1. + require 'logger'
# 2. + Eodhd::Client.log_filename
# 3. + Eodhd::Client.log_file
# 4. + Eodhd::Client.logger
# 5. + Eodhd::Client#log
# 6. ~ Eodhd::Client#do_request: Call log().
# 0/1: Add args to the log string.
# 7. ~ Eodhd::Client#do_request: Add the args to the log string.
# 1/2: Log '?' and args only if args are present.
# 8. ~ Eodhd::Client#log: Construct the log string in the method, constructing a log string with arguments if present.
# 9. ~ Eodhd::Client#do_request: Call the new interface for log().
# 2/3: Fix logging '?' for when args values are nil.
# 10. + Eod::Client#log_args? Only need to check for whether the values are nil, since this will still work for empty args also.
# 11. ~ Eod::Client#log: Use log_args?
# 3/4: + eod.rb.gemspec, + additional necessary library files
# 12. + eod.rb.gemspec
# 13. ~ Gemfile: Use gemspec.
# 14. + lib/Hash/x_www_form_urlencode.rb
# 15. + lib/Thoran/Hash/XWwwFormUrlEncode/x_www_form_url_encode.rb
# 16. + lib/Thoran/String/UrlEncode/url_encode.rb

require_relative 'Eodhd/Client'
require_relative 'Eodhd/EodBulkLastDay'
require_relative 'Eodhd/EodData'
require_relative 'Eodhd/Exchange'
require_relative 'Eodhd/ExchangeSymbol'

class Eodhd
  def initialize(api_token:)
    @api_token = api_token
  end

  def exchanges
    Eodhd::Exchange.all(api_token: @api_token)
  end

  def exchange_symbols(exchange: nil, exchange_code: nil)
    exchange_code ||= exchange.code
    Eodhd::ExchangeSymbol.all(api_token: @api_token, exchange_code: exchange_code)
  end

  def eod_data(exchange: nil, exchange_code: nil, exchange_symbol: nil, symbol: nil, period: nil, from: nil, to: nil)
    exchange_code ||= exchange.code
    symbol ||= exchange_symbol.code
    Eodhd::EodData.all(api_token: @api_token, exchange_code: exchange_code, symbol: symbol, period: period, from: from, to: to)
  end

  def eod_bulk_last_day(exchange: nil, exchange_code: nil, date:)
    exchange_code ||= exchange.code
    Eodhd::EodBulkLastDay.all(api_token: @api_token, exchange_code: exchange_code, date: date)
  end
end
