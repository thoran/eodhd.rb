# Eodhistoricaldata/Symbol.rb
# Eodhistoricaldata::Symbol

module Eodhistoricaldata
  class Symbol
    @list = []

    class << self
      def load(eod_client: nil, exchange_code: nil)
        eod_client.exchange_symbol_list(exchange_code: exchange_code).each do |symbol|
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

      def all(eod_client: nil, exchange_code: nil)
        load(eod_client: eod_client, exchange_code: exchange_code)
        @list
      end

      def find(eod_client: nil, exchange_code: nil, &block)
        all(eod_client: eod_client, exchange_code: exchange_code).find{|symbol| block.call(symbol)}
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
