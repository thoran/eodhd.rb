# Eodhd/Fundamentals.rb
# Eodhd::Fundamentals

require_relative './Fundamentals/AnalystRatings'
require_relative './Fundamentals/Earnings'
require_relative './Fundamentals/ESGScores'
require_relative './Fundamentals/Financials'
require_relative './Fundamentals/General'
require_relative './Fundamentals/Highlights'
require_relative './Fundamentals/Holders'
require_relative './Fundamentals/SharesStats'
require_relative './Fundamentals/SplitsDividends'
require_relative './Fundamentals/Technicals'
require_relative './Fundamentals/Valuation'

class Eodhd
  class Fundamentals
    class << self
      def all(client: nil, api_token: nil, exchange_code:, symbol:, filter: nil)
        load(client: client, api_token: api_token, exchange_code: exchange_code, symbol: symbol, filter: filter)
      end

      private

      def load(client: nil, api_token: nil, exchange_code:, symbol:, filter:)
        client ||= Client.new(api_token: api_token)
        response = client.fundamentals(exchange_code: exchange_code, symbol: symbol, filter: filter)
        self.new(
          exchange_code: exchange_code,
          symbol: symbol,
          general: response['General'],
          highlights: response['Highlights'],
          valuation: response['Valuation'],
          shares_stats: response['SharesStats'],
          technicals: response['Technicals'],
          splits_dividends: response['SplitsDividends'],
          analyst_ratings: response['AnalystRatings'],
          holders: response['Holders'],
          insider_transactions: response['InsiderTransactions'],
          esg_scores: response['ESGScores'],
          outstanding_shares: response['outstandingShares'],
          earnings: response['Earnings'],
          financials: response['Financials']
        )
      end
    end # class << self

    attr_reader\
      :exchange_code,
      :symbol,
      :general,
      :highlights,
      :valuation,
      :shares_stats,
      :technicals,
      :splits_dividends,
      :analyst_ratings,
      :holders,
      :insider_transactions,
      :esg_scores,
      :outstanding_shares,
      :earnings,
      :financials

    private

    def initialize(exchange_code:, symbol:, general:, highlights:, valuation:, shares_stats:, technicals:, splits_dividends:, analyst_ratings:, holders:, insider_transactions:, esg_scores:, outstanding_shares:, earnings:, financials:)
      @exchange_code = exchange_code
      @symbol = symbol
      @general = General.new(general) if general
      @highlights = Highlights.new(highlights) if highlights
      @valuation = Valuation.new(valuation) if valuation
      @shares_stats = SharesStats.new(shares_stats) if shares_stats
      @technicals = Technicals.new(technicals) if technicals
      @splits_dividends = SplitsDividends.new(splits_dividends) if splits_dividends
      @analyst_ratings = AnalystRatings.new(analyst_ratings) if analyst_ratings
      @holders = Holders.new(holders) if holders
      @insider_transactions = insider_transactions
      @esg_scores = ESGScores.new(esg_scores) if esg_scores
      @outstanding_shares = outstanding_shares
      @earnings = Earnings.new(earnings) if earnings
      @financials = Financials.new(financials) if financials
    end
  end
end
