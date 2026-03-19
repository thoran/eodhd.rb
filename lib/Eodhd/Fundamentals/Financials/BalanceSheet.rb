# Eodhd/Fundamentals/Financials/BalanceSheet.rb
# Eodhd::Fundamentals::Financials::BalanceSheet

require_relative './BalanceSheet/Entry'

class Eodhd
  class Fundamentals
    class Financials
      class BalanceSheet
        attr_reader\
          :quarterly,
          :yearly

        private

        def initialize(data)
          @yearly = wrap(data['yearly'])
          @quarterly = wrap(data['quarterly'])
        end

        def wrap(entries)
          return [] unless entries
          entries.values.map{|entry| Entry.new(entry)}.sort_by(&:date)
        end
      end
    end
  end
end
