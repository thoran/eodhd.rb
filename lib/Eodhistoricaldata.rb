# EodHistoricalData.rb
# EodHistoricalData

require_relative 'EodHistoricalData/Client'
require_relative 'EodHistoricalData/EodData'
require_relative 'EodHistoricalData/Exchange'
require_relative 'EodHistoricalData/ExchangeSymbol'

class EodHistoricalData
  def initialize(api_token:)
    @api_token = api_token
  end

  def exchanges
    EodHistoricalData::Exchange.all(api_token: @api_token)
  end

  def exchange_symbols(exchange: nil, exchange_code: nil)
    exchange_code ||= exchange.code
    EodHistoricalData::ExchangeSymbol.all(api_token: @api_token, exchange_code: exchange_code)
  end

  def eod_data(exchange: nil, exchange_code: nil, exchange_symbol: nil, symbol: nil, period: nil)
    exchange_code ||= exchange.code
    symbol ||= exchange_symbol.code
    EodHistoricalData::EodData.all(api_token: @api_token, exchange_code: exchange_code, symbol: symbol, period: period)
  end
end
