# Eodhistoricaldata/Exchange.rb
# Eodhistoricaldata::Exchange

module Eodhistoricaldata
  class Exchange
    @list = []

    class << self
      def load(eod_client:)
        eod_client.exchanges_list.each do |exchange|
          @list << self.new(
            name: exchange['Name'],
            code: exchange['Code'],
            operating_mic: exchange['OperatingMIC'],
            country: exchange['Country'],
            currency: exchange['Currency'],
            country_iso2: exchange['CountryISO2'],
            country_iso3: exchange['CountryISO3']
          )
        end
        @list
      end

      def all(eod_client: nil)
        load(eod_client: eod_client)
        @list
      end

      def find(eod_client: nil, &block)
        all(eod_client:).find{|exchange| block.call(exchange)}
      end
    end # class << self

    attr_reader\
      :name,
      :code,
      :operating_mic,
      :country,
      :currency,
      :country_iso2,
      :country_iso3

    def initialize(name:, code:, operating_mic:, country:, currency:, country_iso2:, country_iso3:)
      @name = name
      @code = code
      @operating_mic = operating_mic
      @country = country
      @currency = currency
      @country_iso2 = country_iso2
      @country_iso3 = country_iso3
    end
  end
end
