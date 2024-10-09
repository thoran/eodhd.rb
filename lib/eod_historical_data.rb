# eod_historical_data.rb

# 20240602
# 0.11.2

# Changes since 0.10:
# -/0 (+ bulk data API)
# 1. + EodHistoricalData#eod_bulk_last_day
# 2. + EodHistoricalData::EodBulkLastDay
# 0/1 (+ tests, gemification-incomplete)
# 3. ~ EodHistoricalData::EodData#load: Use the row values.
# 1/2 (/each/collect/)
# 4. ~ EodHistoricalData::BulkLastDay.load: /each/collect/
# 5. ~ EodHistoricalData::EodData.load: /each/collect/
# 6. ~ EodHistoricalData::Exchange.load: /each/collect/
# 7. ~ EodHistoricalData::ExchangeSymbol.load: /each/collect/

require_relative './EodHistoricalData'
