# Eodhd.rb
# Eodhd

# 20250323
# 0.14.1

# Changes since 0.13:
# -/0: Add WebSockets.
# 1. + Eodhd::WebSocketClient
# 2. + Eodhd#web_socket
# 3. + Eodhd#stream
# 4. + Eodhd#us_quote_stream
# 5. + Eodhd#us_trade_stream
# 6. + Eodhd#forex_stream
# 7. + Eodhd#crypto_stream
# 8. Moved Eodhd::Error from Eodhd::Client to a separate file.
# 0/1: Some fixes for the WebSocketClient interface.
# 9. ~ Eodhd::WebSocketClient: + attr_accessor :consumer
# 10. ~ Eodhd::WebSocketClient: /attr_accessor :symbols/attr_reader :symbols/
# 11. + Eodhd::WebSocketClient#symbols=

require_relative 'Eodhd/Client'
require_relative 'Eodhd/EodBulkLastDay'
require_relative 'Eodhd/EodData'
require_relative 'Eodhd/Exchange'
require_relative 'Eodhd/ExchangeSymbol'
require_relative 'Eodhd/WebSocketClient'

class Eodhd
  def initialize(api_token:, consumer: nil)
    @api_token = api_token
    @consumer = consumer
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

  def web_socket(asset_class:, symbols:)
    Eodhd::WebSocketClient.new(
      api_token: @api_token,
      asset_class: asset_class,
      symbols: symbols,
      consumer: @consumer,
    )
  end

  def stream(asset_class:, symbols:)
    web_socket(asset_class: asset_class, symbols: symbols).run
  end

  def us_trade_stream(symbols)
    stream(asset_class: 'us', symbols: symbols)
  end
  alias_method :us_stream, :us_trade_stream

  def us_quote_stream(symbols)
    stream(asset_class: 'us-quote', symbols: symbols)
  end

  def forex_stream(symbols)
    stream(asset_class: 'forex', symbols: symbols)
  end

  def crypto_stream(symbols)
    stream(asset_class: 'crypto', symbols: symbols)
  end
end
