# Eodhd/Intraday.rb
# Eodhd::Intraday

class Eodhd
  class Intraday
    class << self
      def all(client: nil, api_token: nil, exchange_code: 'US', symbol:, interval:, from: nil, to: nil)
        load(
          client: client,
          api_token: api_token,
          exchange_code: exchange_code,
          symbol: symbol,
          interval: interval,
          from: from,
          to: to
        )
      end

      private

      def load(client: nil, api_token: nil, exchange_code: 'US', symbol:, interval:, from:, to:)
        client ||= Client.new(api_token: api_token)
        client.intraday(
          exchange_code: exchange_code,
          symbol: symbol,
          interval: interval,
          from: from,
          to: to
        ).collect do |intraday_data|
          self.new(
            exchange_code: exchange_code,
            symbol: symbol,
            interval: interval,
            timestamp: intraday_data['timestamp'],
            gmtoffset: intraday_data['gmtoffset'],
            datetime: intraday_data['datetime'],
            open: intraday_data['open'],
            high: intraday_data['high'],
            low: intraday_data['low'],
            close: intraday_data['close'],
            volume: intraday_data['volume']
          )
        end
      end
    end # class << self

    attr_reader\
      :exchange_code,
      :symbol,
      :interval,
      :timestamp,
      :gmtoffset,
      :datetime,
      :open,
      :high,
      :low,
      :close,
      :volume

    private

    def initialize(exchange_code:, symbol:, interval:, timestamp:, gmtoffset:, datetime:, open:, high:, low:, close:, volume:)
      @exchange_code = exchange_code
      @symbol = symbol
      @interval = interval
      @timestamp = timestamp
      @gmtoffset = gmtoffset
      @datetime = datetime
      @open = open
      @high = high
      @low = low
      @close = close
      @volume = volume
    end
  end
end
