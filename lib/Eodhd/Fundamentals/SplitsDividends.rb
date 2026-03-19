# Eodhd/Fundamentals/SplitsDividends.rb
# Eodhd::Fundamentals::SplitsDividends

class Eodhd
  class Fundamentals
    class SplitsDividends
      attr_reader\
        :forward_annual_dividend_rate,
        :forward_annual_dividend_yield,
        :payout_ratio,
        :dividend_date,
        :ex_dividend_date,
        :last_split_factor,
        :last_split_date,
        :number_dividends_by_year

      private

      def initialize(data)
        @forward_annual_dividend_rate = data['ForwardAnnualDividendRate']
        @forward_annual_dividend_yield = data['ForwardAnnualDividendYield']
        @payout_ratio = data['PayoutRatio']
        @dividend_date = data['DividendDate']
        @ex_dividend_date = data['ExDividendDate']
        @last_split_factor = data['LastSplitFactor']
        @last_split_date = data['LastSplitDate']
        @number_dividends_by_year = data['NumberDividendsByYear']
      end
    end
  end
end
