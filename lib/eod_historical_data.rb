# eod_historical_data.rb

# 20230527
# 0.10.0

# Changes since 0.9:
# -/0 (~ EodData: + from, to)
# 1. ~ EodHistoricalData::Client#eod_data: + from, to args
# 2. ~ EodHistoricalData::EodData#all, load: + from, to args
# 3. - EodHistoricalData::EodData#find
# 4. - EodHistoricalData::Exchange#find
# 5. - EodHistoricalData::ExchangeSymbol#find

require_relative './EodHistoricalData'
