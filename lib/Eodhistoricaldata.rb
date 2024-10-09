# Eodhistoricaldata.rb
# Eodhistoricaldata

# 20230412
# 0.1.1

gem 'http.rb'
require 'http.rb'
require 'Pd/PasswordFile'
require 'Pd/Password'
require 'json'

def init
  if File.exist?(Pd::PasswordFile.encrypted_filename)
    Pd::Password.from_csv(Pd::PasswordFile.read)
  end
end

def label
  'eodhistoricaldata.com-api_token'
end

def password
  @password ||= Pd::Password.find(label).first
end

def api_token
  @api_token ||= password.to_h[:password]
end

def exchanges_list
  request_string = "https://eodhistoricaldata.com/api/exchanges-list"
  args = {api_token: api_token} # fmt is always json
  response = HTTP.get(request_string, args)
  JSON.parse(response.body)
end

def exchange_symbol_list(exchange_code:)
  request_string = "https://eodhistoricaldata.com/api/exchange-symbol-list/#{exchange_code}"
  args = {api_token: api_token, fmt: 'json'}
  response = HTTP.get(request_string, args)
  JSON.parse(response.body)
end

def eod_data(exchange_id:, symbol:, period: 'd')
  request_string = "https://eodhistoricaldata.com/api/eod/#{symbol}.#{exchange_id}"
  args = {api_token: api_token, fmt: 'json', period: period}
  response = HTTP.get(request_string, args)
  JSON.parse(response.body)
end

def main
  init
  exchanges_list.each do |exchange|
    p exchange
    exchange_symbol_list(exchange_code: exchange["Code"]).each do |symbol|
      puts "#{exchange["Code"]}:#{symbol["Code"]}"
      p eod_data(exchange_id: exchange["Code"], symbol: symbol["Code"])
    end
  end
end

main if __FILE__ == $0
