# EodHistoricalData/Client.rb
# EodHistoricalData::Client

gem 'http.rb'
require 'http.rb'
require 'json'

class EodHistoricalData
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

    def eod_data(exchange_id:, symbol:, period:, from: nil, to: nil)
      path = "/api/eod/#{symbol}.#{exchange_id}"
      args = {period: period}
      args.merge!(from: from) if from
      args.merge!(to: to) if to
      do_request(request_string: request_string(path), args: args)
    end

    private

    def request_string(path)
      "https://#{API_HOST}#{path}"
    end

    def do_request(request_string:, args: {})
      api_token = args[:api_token] || @api_token
      fmt = args[:fmt] || 'json'
      args.merge!(api_token: api_token, fmt: fmt)
      response = HTTP.get(request_string, args)
      JSON.parse(response.body)
    end
  end
end
