# Eodhistoricaldata/ExchangeSymbol.rb
# Eodhistoricaldata::ExchangeSymbol

class Eodhistoricaldata
  class ExchangeSymbol
    @list = []

    class << self
      def client(api_token:)
        @client ||= Client.new(api_token: api_token)
      end

      def load(client: nil, api_token: nil, exchange_code: nil)
        client ||= self.client(api_token: api_token)
        client.exchange_symbol_list(exchange_code: exchange_code).each do |symbol|
          @list << self.new(
            code: symbol['Code'],
            name: symbol['Name'],
            country: symbol['Country'],
            exchange: symbol['Exchange'],
            currency: symbol['Currency'],
            type: symbol['Type'],
            isin: symbol['Isin']
          )
        end
        @list
      end

      def all(client: nil, api_token: nil, exchange_code: nil)
        load(client: client, api_token: api_token, exchange_code: exchange_code)
      end

      def find(client: nil, api_token: nil, exchange_code: nil, &block)
        all(client: client, api_token: api_token, exchange_code: exchange_code).find{|symbol| block.call(symbol)}
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
