# Eodhd/Fundamentals/Earnings/AnnualEntry.rb
# Eodhd::Fundamentals::Earnings::AnnualEntry

class Eodhd
  class Fundamentals
    class Earnings
      class AnnualEntry
        attr_reader\
          :date,
          :eps_actual

        private

        def initialize(data)
          @date = data['date']
          @eps_actual = data['epsActual']
        end
      end
    end
  end
end
