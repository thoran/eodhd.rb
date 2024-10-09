# Eodhistoricaldata/Exchange.rb
# Eodhistoricaldata::Exchange

class Eodhistoricaldata
  class Exchange
    @list = []

    class << self
      def client(api_token:)
        @client ||= Client.new(api_token: api_token)
      end

      def load(client: nil, api_token: nil)
        client ||= self.client(api_token: api_token)
        client.exchanges_list.each do |exchange|
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

      def all(client: nil, api_token: nil)
        load(client: client, api_token: api_token)
      end

      def find(client: nil, api_token: nil, &block)
        all(client: client, api_token: api_token).find{|exchange| block.call(exchange)}
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
