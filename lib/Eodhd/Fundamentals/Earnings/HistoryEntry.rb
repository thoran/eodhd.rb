# Eodhd/Fundamentals/Earnings/HistoryEntry.rb
# Eodhd::Fundamentals::Earnings::HistoryEntry

class Eodhd
  class Fundamentals
    class Earnings
      class HistoryEntry
        attr_reader\
          :report_date,
          :date,
          :before_after_market,
          :currency,
          :eps_actual,
          :eps_estimate,
          :eps_difference,
          :surprise_percent

        private

        def initialize(data)
          @report_date = data['reportDate']
          @date = data['date']
          @before_after_market = data['beforeAfterMarket']
          @currency = data['currency']
          @eps_actual = data['epsActual']
          @eps_estimate = data['epsEstimate']
          @eps_difference = data['epsDifference']
          @surprise_percent = data['surprisePercent']
        end
      end
    end
  end
end
