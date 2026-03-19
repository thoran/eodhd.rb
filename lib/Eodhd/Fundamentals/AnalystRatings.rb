# Eodhd/Fundamentals/AnalystRatings.rb
# Eodhd::Fundamentals::AnalystRatings

class Eodhd
  class Fundamentals
    class AnalystRatings
      attr_reader\
        :rating,
        :target_price,
        :strong_buy,
        :buy,
        :hold,
        :sell,
        :strong_sell

      private

      def initialize(data)
        @rating = data['Rating']
        @target_price = data['TargetPrice']
        @strong_buy = data['StrongBuy']
        @buy = data['Buy']
        @hold = data['Hold']
        @sell = data['Sell']
        @strong_sell = data['StrongSell']
      end
    end
  end
end
