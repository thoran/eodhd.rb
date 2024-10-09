# Eodhistoricaldata.rb
# Eodhistoricaldata

# 20230419
# 0.2.0

gem 'http.rb'
require 'http.rb'
require 'Pd/PasswordFile'
require 'Pd/Password'
require 'json'

class ApiToken
  class << self
    def init
      if File.exist?(Pd::PasswordFile.encrypted_filename)
        Pd::Password.from_csv(Pd::PasswordFile.read)
      end
    end

    def label
      'eodhistoricaldata.com-api_token'
    end

    def password
      @password ||= (
        init
        Pd::Password.find(label).first
      )
    end

    def api_token
      @api_token ||= password.to_h[:password]
    end
  end
end

class Eodhistoricaldata
  def initialize
    @api_token = ApiToken.api_token
  end

  # This endpoint always returns json regardless of what fmt is specified.
  def exchanges_list
    request_string = "https://eodhistoricaldata.com/api/exchanges-list"
    do_request(request_string: request_string)
  end

  def exchange_symbol_list(exchange_code:)
    request_string = "https://eodhistoricaldata.com/api/exchange-symbol-list/#{exchange_code}"
    do_request(request_string: request_string)
  end

  def eod_data(exchange_id:, symbol:, period: 'd')
    request_string = "https://eodhistoricaldata.com/api/eod/#{symbol}.#{exchange_id}"
    args = {period: period}
    do_request(request_string: request_string, args: args)
  end

  private

  def do_request(request_string:, args: {})
    api_token = args[:api_token] || @api_token
    fmt = args[:fmt] || 'json'
    args.merge!({api_token: api_token, fmt: fmt})
    response = HTTP.get(request_string, args)
    JSON.parse(response.body)
  end
end

def main
  exchange_code = 'AU'
  eod_client = Eodhistoricaldata.new
  symbols = eod_client.exchange_symbol_list(exchange_code: exchange_code)
  symbols.each do |symbol|
    puts "#{exchange_code}:#{symbol["Code"]}"
    p eod_client.eod_data(exchange_id: exchange_code, symbol: symbol["Code"])
  end
end

main if __FILE__ == $0
