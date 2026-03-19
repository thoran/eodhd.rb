# Eodhd/Fundamentals/Earnings.rb
# Eodhd::Fundamentals::Earnings

require_relative './Earnings/AnnualEntry'
require_relative './Earnings/HistoryEntry'
require_relative './Earnings/TrendEntry'

class Eodhd
  class Fundamentals
    class Earnings
      attr_reader\
        :history,
        :trend,
        :annual

      private

      def initialize(data)
        @annual = wrap(data['Annual'], AnnualEntry)
        @history = wrap(data['History'], HistoryEntry)
        @trend = wrap(data['Trend'], TrendEntry)
      end

      def wrap(entries, entry_class)
        return [] unless entries
        entries.values.map{|entry| entry_class.new(entry)}.sort_by(&:date)
      end
    end
  end
end
