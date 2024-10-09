# Eodhistoricaldata.rb
# Eodhistoricaldata

# 20230412
# 0.0.0

gem 'http.rb'
require 'http.rb'

def api_token
  ARGV[0]
end

def exchanges_list
  request_string = "https://eodhistoricaldata.com/api/exchanges-list/?api_token=#{api_token}&fmt=json"
  response = HTTP.get(request_string)
  puts response.body
end

def exchange_symbol_list(exchange_code:)
  request_string = "https://eodhistoricaldata.com/api/exchange-symbol-list/#{exchange_code}?api_token=#{api_token}&fmt=json"
  response = HTTP.get(request_string)
  puts response.body
end

def eod_data(symbol:, exchange_id:, period: 'd')
  request_string = "https://eodhistoricaldata.com/api/eod/#{symbol}.#{exchange_id}?api_token=#{api_token}&period=#{period}&fmt=json"
  response = HTTP.get(request_string)
  puts response.body
end

def main
  exchanges_list
end

main
