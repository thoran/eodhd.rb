# Eodhd/Fundamentals/Earnings/TrendEntry.rb
# Eodhd::Fundamentals::Earnings::TrendEntry

class Eodhd
  class Fundamentals
    class Earnings
      class TrendEntry
        attr_reader\
          :date,
          :period,
          :growth,
          :earnings_estimate_avg,
          :earnings_estimate_low,
          :earnings_estimate_high,
          :earnings_estimate_year_ago_eps,
          :earnings_estimate_number_of_analysts,
          :earnings_estimate_growth,
          :revenue_estimate_avg,
          :revenue_estimate_low,
          :revenue_estimate_high,
          :revenue_estimate_year_ago_eps,
          :revenue_estimate_number_of_analysts,
          :revenue_estimate_growth,
          :eps_trend_current,
          :eps_trend_7_days_ago,
          :eps_trend_30_days_ago,
          :eps_trend_60_days_ago,
          :eps_trend_90_days_ago,
          :eps_revisions_up_last_7_days,
          :eps_revisions_up_last_30_days,
          :eps_revisions_down_last_7_days,
          :eps_revisions_down_last_30_days

        private

        def initialize(data)
          @date = data['date']
          @period = data['period']
          @growth = data['growth']
          @earnings_estimate_avg = data['earningsEstimateAvg']
          @earnings_estimate_low = data['earningsEstimateLow']
          @earnings_estimate_high = data['earningsEstimateHigh']
          @earnings_estimate_year_ago_eps = data['earningsEstimateYearAgoEps']
          @earnings_estimate_number_of_analysts = data['earningsEstimateNumberOfAnalysts']
          @earnings_estimate_growth = data['earningsEstimateGrowth']
          @revenue_estimate_avg = data['revenueEstimateAvg']
          @revenue_estimate_low = data['revenueEstimateLow']
          @revenue_estimate_high = data['revenueEstimateHigh']
          @revenue_estimate_year_ago_eps = data['revenueEstimateYearAgoEps']
          @revenue_estimate_number_of_analysts = data['revenueEstimateNumberOfAnalysts']
          @revenue_estimate_growth = data['revenueEstimateGrowth']
          @eps_trend_current = data['epsTrendCurrent']
          @eps_trend_7_days_ago = data['epsTrend7daysAgo']
          @eps_trend_30_days_ago = data['epsTrend30daysAgo']
          @eps_trend_60_days_ago = data['epsTrend60daysAgo']
          @eps_trend_90_days_ago = data['epsTrend90daysAgo']
          @eps_revisions_up_last_7_days = data['epsRevisionsUpLast7days']
          @eps_revisions_up_last_30_days = data['epsRevisionsUpLast30days']
          @eps_revisions_down_last_7_days = data['epsRevisionsDownLast7days']
          @eps_revisions_down_last_30_days = data['epsRevisionsDownLast30days']
        end
      end
    end
  end
end
