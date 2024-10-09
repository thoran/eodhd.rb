# Eodhistoricaldata.rb
# Eodhistoricaldata

# 20230420
# 0.3.1

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

gem 'http.rb'
require 'http.rb'
require 'json'

class Eodhistoricaldata
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

def exchanges(eod_client)
  eod_client.exchanges_list.each do |exchange|
    p exchange
  end
end

def symbols(eod_client, exchange_code)
  symbols = eod_client.exchange_symbol_list(exchange_code: exchange_code)
  symbols.each do |symbol|
    puts symbol["Code"]
  end
end

def main
  label = 'eodhistoricaldata.com-api_token'
  api_token = ApiToken.new(label: label).api_token
  eod_client = Eodhistoricaldata.new(api_token: api_token)
  case ARGV[0]
  when 'exchanges'
    exchanges(eod_client)
  when 'symbols'
    exchange_code = ARGV[1]
    symbols(eod_client, exchange_code)
  end
end

main if __FILE__ == $0
