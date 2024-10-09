# Eodhd/Client.rb
# Eodhd::Client

gem 'http.rb'
require 'http.rb'
require 'json'
require 'logger'
require 'Hash/x_www_form_urlencode'

class Eodhd
  class Client

    class << self
      def log_filename
        File.expand_path('~/log/eodhd/log.txt')
      end

      def log_file
        File.open(log_filename, File::WRONLY | File::APPEND | File::CREAT)
      end

      def logger
        @logger ||= Logger.new(log_file, 'daily')
      end
    end # class << self

    API_HOST = 'eodhd.com'

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

    def eod_bulk_last_day(exchange_id:, date:)
      path = "/api/eod-bulk-last-day/#{exchange_id}"
      args = {date: date}
      do_request(request_string: request_string(path), args: args)
    end

    private

    def request_string(path)
      "https://#{API_HOST}#{path}"
    end

    def log(request_string:, args:)
      log_string = "GET #{request_string}"
      log_string << "?#{args.x_www_form_urlencode}" unless args.empty?
      self.class.logger.info(log_string)
    end

    def do_request(request_string:, args: {})
      log(request_string: request_string, args: args)
      api_token = args[:api_token] || @api_token
      fmt = args[:fmt] || 'json'
      args.merge!(api_token: api_token, fmt: fmt)
      response = HTTP.get(request_string, args)
      JSON.parse(response.body)
    end
  end
end
