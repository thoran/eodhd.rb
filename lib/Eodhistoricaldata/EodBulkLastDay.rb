# EodHistoricalData/EodBulkLastDay.rb
# EodHistoricalData::EodBulkLastDay

class EodHistoricalData
  class EodBulkLastDay
    class << self
      def all(client: nil, api_token: nil, exchange_code:, date:)
        load(client: client, api_token: api_token, exchange_code: exchange_code, date:)
      end

      private

      def load(client: nil, api_token: nil, exchange_code:, date:)
        client ||= Client.new(api_token: api_token)
        client.eod_bulk_last_day(exchange_id: exchange_code, date: date).collect do |eod_bulk_last_day|
          self.new(
            code: eod_bulk_last_day['code'],
            exchange_short_name: eod_bulk_last_day['exchange_short_name'],
            date: eod_bulk_last_day['date'],
            open: eod_bulk_last_day['open'],
            high: eod_bulk_last_day['high'],
            low: eod_bulk_last_day['low'],
            close: eod_bulk_last_day['close'],
            adjusted_close: eod_bulk_last_day['adjusted_close'],
            volume: eod_bulk_last_day['volume']
          )
        end
      end
    end # class << self

    attr_reader\
      :code,
      :exchange_short_name,
      :date,
      :open,
      :high,
      :low,
      :close,
      :adjusted_close,
      :volume

    def initialize(code:, exchange_short_name:, date:, open:, high:, low:, close:, adjusted_close:, volume:)
      @code = code
      @exchange_short_name = exchange_short_name
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
