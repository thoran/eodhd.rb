# EodHistoricalData/ExchangeSymbol.rb
# EodHistoricalData::ExchangeSymbol

class EodHistoricalData
  class ExchangeSymbol
    class << self
      def all(client: nil, api_token: nil, exchange_code: nil)
        load(client: client, api_token: api_token, exchange_code: exchange_code)
      end

      private

      def load(client: nil, api_token: nil, exchange_code: nil)
        client ||= Client.new(api_token: api_token)
        client.exchange_symbol_list(exchange_code: exchange_code).collect do |symbol|
          self.new(
            code: symbol['Code'],
            name: symbol['Name'],
            country: symbol['Country'],
            exchange: symbol['Exchange'],
            currency: symbol['Currency'],
            type: symbol['Type'],
            isin: symbol['Isin']
          )
        end
      end
    end # class << self

    attr_reader\
      :code,
      :name,
      :country,
      :exchange,
      :currency,
      :type,
      :isin

    def initialize(code:, name:, country:, exchange:, currency:, type:, isin:)
      @code = code
      @name = name
      @country = country
      @exchange = exchange
      @currency = currency
      @type = type
      @isin = isin
    end
  end
end
