# Eodhistoricaldata/EodData.rb
# Eodhistoricaldata::EodData

module Eodhistoricaldata
  class EodData
    @list = []

    class << self
      def client(api_token:)
        @client ||= Client.new(api_token: api_token)
      end

      def load(client: nil, api_token: nil, exchange_code:, symbol:)
        client ||= self.client(api_token: api_token)
        client.eod_data(exchange_id: exchange_code, symbol: symbol, period: 'd').each do |eod_data|
          @list << self.new(
            exchange_code: exchange_code,
            symbol: symbol,
            date: eod_data['date'],
            open: eod_data['open'],
            high: eod_data['high'],
            low: eod_data['low'],
            close: eod_data['close'],
            adjusted_close: eod_data['adjusted_close'],
            volume: eod_data['volume']
          )
        end
        @list
      end

      def all(client: nil, api_token: nil, exchange_code:, symbol:)
        load(client: client, api_token: api_token, exchange_code: exchange_code, symbol: symbol)
      end

      def find(client: nil, api_token: nil, exchange_code:, symbol:, &block)
        all(client: client, api_token: api_token, exchange_code: exchange_code, symbol: symbol).find{|eod_data| block.call(eod_data)}
      end
    end # class << self

    attr_reader\
      :exchange_code,
      :symbol,
      :date,
      :open,
      :high,
      :low,
      :close,
      :adjusted_close,
      :volume

    def initialize(exchange_code:, symbol:, date:, open:, high:, low:, close:, adjusted_close:, volume:)
      @exchange_code = exchange_code
      @symbol = symbol
      @date = date
      @open = open
      @high = high
      @low = low
      @close = close
      @adjusted_close = adjusted_close
      @volume = volume
    end
  end
end
