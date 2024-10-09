# eodhistoricaldata.rb
# Eodhistoricaldata

# 20230521
# 0.8.0

# Changes since 0.7:
# 0 (Create an easy to use interface on a top-level object.)
# 1. ~ Eodhistoricaldata constant: /module/class/
# 2. + Eodhistoricaldata#initialize
# 3. + Eodhistoricaldata#exchanges
# 4. + Eodhistoricaldata#exchange_symbols
# 5. + Eodhistoricaldata#eod_data

require_relative 'Eodhistoricaldata/Client'
require_relative 'Eodhistoricaldata/EodData'
require_relative 'Eodhistoricaldata/Exchange'
require_relative 'Eodhistoricaldata/ExchangeSymbol'

class Eodhistoricaldata
  def initialize(api_token:)
    @api_token = api_token
  end

  def exchanges
    Eodhistoricaldata::Exchange.all(api_token: @api_token)
  end

  def exchange_symbols(exchange: nil, exchange_code: nil)
    exchange_code ||= exchange.code
    Eodhistoricaldata::ExchangeSymbol.all(api_token: @api_token, exchange_code: exchange_code)
  end

  def eod_data(exchange: nil, exchange_code: nil, exchange_symbol: nil, symbol: nil)
    exchange_code ||= exchange.code
    symbol ||= exchange_symbol.code
    Eodhistoricaldata::EodData.all(api_token: @api_token, exchange_code: exchange_code, symbol: symbol)
  end
end
