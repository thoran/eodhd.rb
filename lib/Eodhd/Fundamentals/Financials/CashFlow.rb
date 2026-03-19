# Eodhd/Fundamentals/Financials/CashFlow.rb
# Eodhd::Fundamentals::Financials::CashFlow

require_relative './CashFlow/Entry'

class Eodhd
  class Fundamentals
    class Financials
      class CashFlow
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
