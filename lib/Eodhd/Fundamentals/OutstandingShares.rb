# Eodhd/Fundamentals/OutstandingShares.rb
# Eodhd::Fundamentals::OutstandingShares

require_relative './OutstandingShares/Entry'

class Eodhd
  class Fundamentals
    class OutstandingShares
      attr_reader\
        :annual,
        :quarterly

      private

      def initialize(data)
        @annual = wrap(data['annual'])
        @quarterly = wrap(data['quarterly'])
      end

      def wrap(entries)
        return [] unless entries
        entries.values.map{|entry| Entry.new(entry)}.sort_by(&:date)
      end
    end
  end
end
