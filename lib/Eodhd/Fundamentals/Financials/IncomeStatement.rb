# Eodhd/Fundamentals/Financials/IncomeStatement.rb
# Eodhd::Fundamentals::Financials::IncomeStatement

require_relative './IncomeStatement/Entry'

class Eodhd
  class Fundamentals
    class Financials
      class IncomeStatement
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
