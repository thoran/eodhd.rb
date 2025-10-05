# Eodhd/Client.rb
# Eodhd::Client

gem 'http.rb'

require 'http.rb'
require 'json'

require_relative './DefaultLogger'
require_relative './Error'
require_relative '../Hash/x_www_form_urlencode'
require_relative './Validations'

class Eodhd
  class Client

    API_HOST = 'eodhd.com'

    class << self
      def path_prefix
        '/api'
      end
    end # class << self

    include Validations

    # This endpoint always returns json regardless of what fmt is specified.
    def exchanges_list
      response = get(path: '/exchanges-list')
      handle_response(response)
    end

    def exchange_symbol_list(exchange_code:)
      validate_arguments(exchange_code: exchange_code)
      response = get(path: "/exchange-symbol-list/#{exchange_code}")
      handle_response(response)
    end

    def eod_data(exchange_id:, symbol:, period:, from: nil, to: nil)
      validate_arguments(
        exchange_id: exchange_id,
        symbol: symbol,
        period: period,
        from: from,
        to: to
      )
      args = {period: period}
      args.merge!(from: from) if from
      args.merge!(to: to) if to
      response = get(path: "/eod/#{symbol}.#{exchange_id}", args: args)
      handle_response(response)
    end

    def eod_bulk_last_day(exchange_id:, date:)
      validate_arguments(exchange_id: exchange_id, date: date)
      args = {date: date}
      response = get(path: "/eod-bulk-last-day/#{exchange_id}", args: args)
      handle_response(response)
    end

    attr_accessor\
      :api_token,
      :logger

    private

    def initialize(api_token: nil, logger: nil, use_default_logger: false)
      @api_token = api_token
      @logger = use_default_logger ? DefaultLogger.logger : logger
    end

    def request_string(path)
      "https://#{API_HOST}#{self.class.path_prefix}#{path}"
    end

    def log_args?(args)
      !args.values.all?(&:nil?)
    end

    def log_request(verb:, request_string:, args:)
      log_string = "#{verb} #{request_string}"
      if log_args?(args)
        log_string << "?#{args.x_www_form_urlencode}"
      end
      @logger.info(log_string)
    end

    def log_response(code:, message:, body:)
      log_string = "#{code}\n#{message}\n#{body}"
      @logger.info(log_string)
    end

    def log_error(code:, message:, body:)
      log_string = "#{code}\n#{message}\n#{body}"
      @logger.error(log_string)
    end

    def do_request(verb:, path:, args: {})
      api_token = args[:api_token] || @api_token
      fmt = args[:fmt] || 'json'
      args.merge!(api_token: api_token, fmt: fmt)
      log_request(verb: verb, request_string: request_string(path), args: args) if use_logging?
      HTTP.send(verb.to_s.downcase, request_string(path), args)
    end

    def get(path:, args: {})
      do_request(verb: 'GET', path: path, args: args)
    end

    def handle_response(response)
      if response.success?
        parsed_body = JSON.parse(response.body)
        log_response(code: response.code, message: response.message, body: response.body) if use_logging?
        parsed_body
      else
        log_error(code: response.code, message: response.message, body: response.body) if use_logging?
        raise Eodhd::Error.new(code: response.code, message: response.message, body: response.body)
      end
    end

    def use_logging?
      !@logger.nil?
    end
  end
end
