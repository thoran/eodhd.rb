# Eodhd/Fundamentals/SharesStats.rb
# Eodhd::Fundamentals::SharesStats

class Eodhd
  class Fundamentals
    class SharesStats
      attr_reader\
        :shares_outstanding,
        :shares_float,
        :percent_insiders,
        :percent_institutions,
        :shares_short,
        :shares_short_prior_month,
        :short_ratio,
        :short_percent_outstanding,
        :short_percent_float

      private

      def initialize(data)
        @shares_outstanding = data['SharesOutstanding']
        @shares_float = data['SharesFloat']
        @percent_insiders = data['PercentInsiders']
        @percent_institutions = data['PercentInstitutions']
        @shares_short = data['SharesShort']
        @shares_short_prior_month = data['SharesShortPriorMonth']
        @short_ratio = data['ShortRatio']
        @short_percent_outstanding = data['ShortPercentOutstanding']
        @short_percent_float = data['ShortPercentFloat']
      end
    end
  end
end
