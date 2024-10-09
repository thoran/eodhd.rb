# Eodhd/Exchange.rb
# Eodhd::Exchange

class Eodhd
  class Exchange
    class << self
      def all(client: nil, api_token: nil)
        load(client: client, api_token: api_token)
      end

      private

      def load(client: nil, api_token: nil)
        client ||= Client.new(api_token: api_token)
        client.exchanges_list.collect do |exchange|
          self.new(
            name: exchange['Name'],
            code: exchange['Code'],
            operating_mic: exchange['OperatingMIC'],
            country: exchange['Country'],
            currency: exchange['Currency'],
            country_iso2: exchange['CountryISO2'],
            country_iso3: exchange['CountryISO3']
          )
        end
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
