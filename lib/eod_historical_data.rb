# eod_historical_data.rb

# 20231110
# 0.11.1

# Changes since 0.9:
# -/0 (+ bulk data API)
# 1. + EodHistoricalData#eod_bulk_last_day
# 2. + EodHistoricalData::EodBulkLastDay
# 0/1 (+ tests, gemification)
# 3. ~ EodHistoricalData::EodData#load: Use the row values.
# 4.

require_relative './EodHistoricalData'
