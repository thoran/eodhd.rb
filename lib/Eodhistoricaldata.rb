# Eodhistoricaldata.rb
# Eodhistoricaldata

# 20230420
# 0.4.0

require 'Pd/PasswordFile'
require 'Pd/Password'

class ApiToken
  def initialize(label:)
    @label = label
    setup
  end

  def password
    @password ||= Pd::Password.find(@label).first
  end

  def api_token
    @api_token ||= password.to_h[:password]
  end

  private

  def setup
    if File.exist?(Pd::PasswordFile.encrypted_filename)
      Pd::Password.from_csv(Pd::PasswordFile.read)
    end
  end
end

class Eodhistoricaldata
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

      def all
        load(eod_client: eod_client, exchange_code: exchange_code)
        @list
      end

      def find(&block)
        all.find{|exchange| block.call(exchange)}
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

class Eodhistoricaldata
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

      def find(&block)
        all.find{|symbol| block.call(symbol)}
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

gem 'http.rb'
require 'http.rb'
require 'json'

class Eodhistoricaldata
  class Client

    API_HOST = 'eodhistoricaldata.com'

    def initialize(api_token:)
      @api_token = api_token
    end

    # This endpoint always returns json regardless of what fmt is specified.
    def exchanges_list
      path = "/api/exchanges-list"
      do_request(request_string: request_string(path))
    end

    def exchange_symbol_list(exchange_code:)
      path = "/api/exchange-symbol-list/#{exchange_code}"
      do_request(request_string: request_string(path))
    end

    def eod_data(exchange_id:, symbol:, period: 'd')
      path = "/api/eod/#{symbol}.#{exchange_id}"
      args = {period: period}
      do_request(request_string: request_string(path), args: args)
    end

    private

    def request_string(path)
      "https://#{API_HOST}#{path}"
    end

    def do_request(request_string:, args: {})
      api_token = args[:api_token] || @api_token
      fmt = args[:fmt] || 'json'
      args.merge!({api_token: api_token, fmt: fmt})
      response = HTTP.get(request_string, args)
      JSON.parse(response.body)
    end

  end
end

def main
  label = 'eodhistoricaldata.com-api_token'
  api_token = ApiToken.new(label: label).api_token
  eod_client = Eodhistoricaldata::Client.new(api_token: api_token)
  case ARGV[0]
  when 'exchanges'
    exchanges = Eodhistoricaldata::Exchange.load(eod_client: eod_client)
    exchanges.each{|exchange| p exchange}
  when 'symbols'
    operating_mic = ARGV[1]
    exchanges = Eodhistoricaldata::Exchange.load(eod_client: eod_client)
    exchange = exchanges.find{|exchange| exchange.operating_mic == operating_mic}
    Eodhistoricaldata::Symbol.all(eod_client: eod_client, exchange_code: exchange.code).each do |symbol|
      p symbol
    end
  end
end

main if __FILE__ == $0
