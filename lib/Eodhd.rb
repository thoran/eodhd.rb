# Eodhd.rb
# Eodhd

# 20250321
# 0.13.8

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
# 10. + Eodhd::Client#log_args? Only need to check for whether the values are nil, since this will still work for empty args also.
# 11. ~ Eodhd::Client#log: Use log_args?
# 3/4: + eodhd.rb.gemspec, + additional necessary library files
# 12. + eodhd.rb.gemspec
# 13. ~ Gemfile: Use gemspec.
# 14. + lib/Hash/x_www_form_urlencode.rb
# 15. + lib/Thoran/Hash/XWwwFormUrlEncode/x_www_form_url_encode.rb
# 16. + lib/Thoran/String/UrlEncode/url_encode.rb
# 4/5: Create a directory for the log file when running for the first time and also allow specification of the log file path.
# 17. ~ Eodhd::Client#log_file: Create the log file directory if necessary.
# 18. ~ Eodhd::Client: + attr_writer :log_file_path
# 19. + Eodhd::Client#default_log_file_path
# 20. ~ Eodhd::Client: /log_filename/log_file_path/
# 5/6: Error handling for HTTP responses.
# 21. + Eodhd::Client#handle_response
# 22. + Eodhd::Client#get
# 23. ~ Eodhd::Client#do_request: Accepts a verb and a path now as well as arguments, instead of a request string and arguments.
# 23. + Eodhd::Error
# 24. ~ Eodhd::Client#log: + verb argument
# 25. ~ Eodhd::Client public methods: Use get() and handle_response().
# 6/7. Logging for HTTP errors.
# 26. ~ Eodhd::Client: /log()/log_request()/
# 27. + Eodhd::Client#log_error
# 28. ~ Eodhd::Client#do_request: /log/log_request/.
# 29. ~ Eodhd::Client#handle_response: Use log_error().
# 7/8. Fix typo.
# 30. ~ Eodhd::Client#exchanges_list: Remove extraneous parenthesis.

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
