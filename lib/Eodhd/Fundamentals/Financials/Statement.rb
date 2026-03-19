# Eodhd/Fundamentals/Financials/Statement.rb
# Eodhd::Fundamentals::Financials::Statement

class Eodhd
  class Fundamentals
    class Financials
      class Statement
        attr_reader\
          :quarterly,
          :yearly

        private

        def initialize(data)
          @quarterly = data['quarterly']
          @yearly = data['yearly']
        end
      end
    end
  end
end
