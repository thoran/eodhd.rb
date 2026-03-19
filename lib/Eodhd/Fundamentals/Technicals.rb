# Eodhd/Fundamentals/Technicals.rb
# Eodhd::Fundamentals::Technicals

class Eodhd
  class Fundamentals
    class Technicals
      attr_reader\
        :beta,
        :fifty_two_week_high,
        :fifty_two_week_low,
        :fifty_day_ma,
        :two_hundred_day_ma,
        :shares_short,
        :shares_short_prior_month,
        :short_ratio,
        :short_percent

      private

      def initialize(data)
        @beta = data['Beta']
        @fifty_two_week_high = data['52WeekHigh']
        @fifty_two_week_low = data['52WeekLow']
        @fifty_day_ma = data['50DayMA']
        @two_hundred_day_ma = data['200DayMA']
        @shares_short = data['SharesShort']
        @shares_short_prior_month = data['SharesShortPriorMonth']
        @short_ratio = data['ShortRatio']
        @short_percent = data['ShortPercent']
      end
    end
  end
end
