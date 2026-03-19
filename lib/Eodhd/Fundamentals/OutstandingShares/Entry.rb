# Eodhd/Fundamentals/OutstandingShares/Entry.rb
# Eodhd::Fundamentals::OutstandingShares::Entry

class Eodhd
  class Fundamentals
    class OutstandingShares
      class Entry
        attr_reader\
          :date,
          :date_formatted,
          :shares_mln,
          :shares

        private

        def initialize(data)
          @date = data['date']
          @date_formatted = data['dateFormatted']
          @shares_mln = data['sharesMln']
          @shares = data['shares']
        end
      end
    end
  end
end
