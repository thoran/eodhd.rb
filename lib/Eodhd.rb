# Eodhd.rb
# Eodhd

# 20240706
# 0.13.0

# Changes since 0.12:
# -/0: Add logging.
# 1. + require 'logger'
# 2. + Eodhd::Client.log_filename
# 3. + Eodhd::Client.log_file
# 4. + Eodhd::Client.logger
# 5. + Eodhd::Client#log
# 6. ~ Eodhd::Client#do_request: Call log().

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
