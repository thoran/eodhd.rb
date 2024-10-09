# eod_historical_data.rb

# 20230521, 22
# 0.9.0

# Changes since 0.8:
# -/0 (/Eodhistoricaldata/EodHistoricalData/, - self.client, self.load: public --> private)
# 1. /Eodhistoricaldata/EodHistoricalData/
# 2. - EodHistoricalData::EodData.client
# 3. - EodHistoricalData::Exchange.client
# 4. - EodHistoricalData::ExchangeSymbol.client
# 5. ~ EodHistoricalData::ExchangeSymbol.all, .find, .load: + period: argument
# 6. ~ EodHistoricalData#eod_data: + period: argument
# 7. ~ EodHistoricalData::EodData.load: public --> private
# 8. ~ EodHistoricalData::Exchange.load: public --> private
# 9. ~ EodHistoricalData::ExchangeSymbol.load: public --> private

require_relative './EodHistoricalData'
