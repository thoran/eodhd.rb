# Eodhd/WebSocketClient.rb
# Eodhd::WebSocketClient

# Notes:
# 1. All 4 of 4 WebSocket endpoints which Eodhd provides (See https://eodhd.com/financial-apis/new-real-time-data-api-websockets.) are as folllows...
#   i.   US market trade data: wss://ws.eodhistoricaldata.com/ws/us?api_token=XXX
#   ii.  US market quote data: wss://ws.eodhistoricaldata.com/ws/us-quote?api_token=XXX
#   iii. Forex: wss://ws.eodhistoricaldata.com/ws/forex?api_token=XXX
#   iv.  Crypto: wss://ws.eodhistoricaldata.com/ws/crypto?api_token=XXX

require 'iodine'
require 'JSON'
require 'UnixTime'

class Eodhd
  class WebSocketClient
    API_HOST = 'ws.eodhistoricaldata.com'

    class Handler
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

      def on_open(connection)
        connection.write({action: 'subscribe', symbols: @symbols}.to_json)
      end

      def on_message(connection, message)
        dataframe = handle_response(message)
        @consumer.call(dataframe)
      end

      def on_close(connection)
        Iodine.stop
      end

      private

      def initialize(symbols:, consumer:)
        @symbols = symbols
        @consumer = consumer
      end

      def log_error(code:, message:, body:)
        log_string = "WebSocketError #{code}\n#{message}\n#{body}"
        self.class.logger.error(log_string)
      end

      def handle_response(message)
        if parsed_json = JSON.parse(message)
          parsed_json
        else
          log_error(
            message: response.message,
          )
          raise Eodhd::Error.new(
            code: 'ws',
            message: response.message,
            body: ''
          )
        end
      end
    end

    class << self
      def path_prefix
        '/ws'
      end

      def us_trade(api_token:, symbols:, consumer:)
        self.class.new(api_token: api_token, asset_class: 'us', symbols: symbols, consumer: consumer)
      end
      alias_method :us, :us_trade

      def us_quote(api_token:, symbols:, consumer:)
        self.class.new(api_token: api_token, asset_class: 'us-quote', symbols: symbols, consumer: consumer)
      end

      def forex(api_token:, symbols:, consumer:)
        self.class.new(api_token: api_token, asset_class: 'forex', symbols: symbols, consumer: consumer)
      end

      def crypto(api_token:, symbols:, consumer:)
        self.class.new(api_token: api_token, asset_class: 'crypto', symbols: symbols, consumer: consumer)
      end
    end # class << self

    attr_accessor\
      :api_token,
      :asset_class,
      :consumer

    attr_reader\
      :symbols

    def symbols=(symbols)
      @symbols = format_symbols(symbols)
    end

    def run
      Iodine.threads = 1
      Iodine.connect(url: url, handler: Handler.new(symbols: @symbols, consumer: @consumer))
      Iodine.start
    rescue SystemExit, Interrupt
      return
    end

    private

    def initialize(api_token:, asset_class:, symbols:, consumer:)
      @api_token = api_token
      @asset_class = asset_class # crypto, forex, us-quote, us
      @symbols = format_symbols(symbols)
      @consumer = consumer
    end

    def format_symbols(symbols)
      if symbols.is_a?(Array)
        symbols.join(',')
      elsif symbols.is_a?(String)
        symbols
      end
    end

    def url
      "wss://#{API_HOST}#{self.class.path_prefix}/#{@asset_class}?api_token=#{@api_token}"
    end
  end
end
