# Eodhd/Fundamentals/Highlights.rb
# Eodhd::Fundamentals::Highlights

class Eodhd
  class Fundamentals
    class Highlights
      attr_reader\
        :market_capitalization,
        :ebitda,
        :pe_ratio,
        :peg_ratio,
        :wall_street_target_price,
        :book_value,
        :dividend_share,
        :dividend_yield,
        :earnings_share,
        :eps_estimate_current_year,
        :eps_estimate_next_year,
        :eps_estimate_next_quarter,
        :eps_estimate_current_quarter,
        :most_recent_quarter,
        :profit_margin,
        :operating_margin_ttm,
        :return_on_assets_ttm,
        :return_on_equity_ttm,
        :revenue_ttm,
        :revenue_per_share_ttm,
        :quarterly_revenue_growth_yoy,
        :gross_profit_ttm,
        :diluted_eps_ttm,
        :quarterly_earnings_growth_yoy

      private

      def initialize(data)
        @market_capitalization = data['MarketCapitalization']
        @ebitda = data['EBITDA']
        @pe_ratio = data['PERatio']
        @peg_ratio = data['PEGRatio']
        @wall_street_target_price = data['WallStreetTargetPrice']
        @book_value = data['BookValue']
        @dividend_share = data['DividendShare']
        @dividend_yield = data['DividendYield']
        @earnings_share = data['EarningsShare']
        @eps_estimate_current_year = data['EPSEstimateCurrentYear']
        @eps_estimate_next_year = data['EPSEstimateNextYear']
        @eps_estimate_next_quarter = data['EPSEstimateNextQuarter']
        @eps_estimate_current_quarter = data['EPSEstimateCurrentQuarter']
        @most_recent_quarter = data['MostRecentQuarter']
        @profit_margin = data['ProfitMargin']
        @operating_margin_ttm = data['OperatingMarginTTM']
        @return_on_assets_ttm = data['ReturnOnAssetsTTM']
        @return_on_equity_ttm = data['ReturnOnEquityTTM']
        @revenue_ttm = data['RevenueTTM']
        @revenue_per_share_ttm = data['RevenuePerShareTTM']
        @quarterly_revenue_growth_yoy = data['QuarterlyRevenueGrowthYOY']
        @gross_profit_ttm = data['GrossProfitTTM']
        @diluted_eps_ttm = data['DilutedEpsTTM']
        @quarterly_earnings_growth_yoy = data['QuarterlyEarningsGrowthYOY']
      end
    end
  end
end
