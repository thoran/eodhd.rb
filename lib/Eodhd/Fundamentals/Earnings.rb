# Eodhd/Fundamentals/Earnings.rb
# Eodhd::Fundamentals::Earnings

class Eodhd
  class Fundamentals
    class Earnings
      attr_reader\
        :history,
        :trend,
        :annual

      private

      def initialize(data)
        @history = data['History']
        @trend = data['Trend']
        @annual = data['Annual']
      end
    end
  end
end
