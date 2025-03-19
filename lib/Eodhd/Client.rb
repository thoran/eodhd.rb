# Eodhd/Client.rb
# Eodhd::Client

require 'fileutils'
require 'Hash/x_www_form_urlencode'
gem 'http.rb'
require 'http.rb'
require 'json'
require 'logger'

class Eodhd
  class Client

    API_HOST = 'eodhd.com'

    class << self
      attr_writer :log_file_path

      def default_log_file_path
        File.join(%w{~ log eodhd log.txt})
      end

      def log_file_path
        File.expand_path(@log_file_path || default_log_file_path)
      end

      def log_file
        FileUtils.mkdir_p(File.dirname(log_file_path))
        File.open(log_file_path, File::WRONLY | File::APPEND | File::CREAT)
      end

      def logger
        @logger ||= Logger.new(log_file, 'daily')
      end
    end # class << self

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

    def initialize(api_token:)
      @api_token = api_token
    end

    def request_string(path)
      "https://#{API_HOST}#{path}"
    end

    def log_args?(args)
      !args.values.all?(&:nil?)
    end

    def log(request_string:, args:)
      log_string = "GET #{request_string}"
      if log_args?(args)
        log_string << "?#{args.x_www_form_urlencode}"
      end
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
