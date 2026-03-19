# Eodhd/Fundamentals_test.rb

require_relative '../helper'

describe Eodhd::Fundamentals do
  let(:api_token){ENV.fetch('EODHD_API_TOKEN', '<API_TOKEN>')}
  let(:fd){Eodhd::Fundamentals.all(api_token: api_token, exchange_code: 'US', symbol: 'AAPL')}

  describe ".all" do
    it "returns an Eodhd::Fundamentals object" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd).must_be_kind_of(Eodhd::Fundamentals)
      end
    end

    it "stores exchange_code and symbol" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.exchange_code).must_equal('US')
        _(fd.symbol).must_equal('AAPL')
      end
    end

    it "returns General as an Eodhd::Fundamentals::General" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.general).must_be_kind_of(Eodhd::Fundamentals::General)
        _(fd.general.code).must_equal('AAPL')
        _(fd.general.name).wont_be_nil
      end
    end

    it "returns Highlights as an Eodhd::Fundamentals::Highlights" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.highlights).must_be_kind_of(Eodhd::Fundamentals::Highlights)
        _(fd.highlights.market_capitalization).wont_be_nil
      end
    end

    it "returns Valuation as an Eodhd::Fundamentals::Valuation" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.valuation).must_be_kind_of(Eodhd::Fundamentals::Valuation)
      end
    end

    it "returns Financials as an Eodhd::Fundamentals::Financials" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.financials).must_be_kind_of(Eodhd::Fundamentals::Financials)
      end
    end

    it "returns Financials with typed income_statement, balance_sheet, and cash_flow" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.financials.income_statement).must_be_kind_of(Eodhd::Fundamentals::Financials::IncomeStatement)
        _(fd.financials.balance_sheet).must_be_kind_of(Eodhd::Fundamentals::Financials::BalanceSheet)
        _(fd.financials.cash_flow).must_be_kind_of(Eodhd::Fundamentals::Financials::CashFlow)
      end
    end

    it "returns quarterly and yearly as sorted arrays of typed entries" do
      VCR.use_cassette('fundamentals_aapl') do
        yearly = fd.financials.balance_sheet.yearly
        _(yearly).must_be_kind_of(Array)
        _(yearly.first).must_be_kind_of(Eodhd::Fundamentals::Financials::BalanceSheet::Entry)
        _(fd.financials.balance_sheet.quarterly).must_be_kind_of(Array)
        dates = yearly.map(&:date)
        _(dates).must_equal(dates.sort)
        _(dates.first).must_equal('1985-09-30')
      end
    end

    it "resolves interpreted and typo-corrected balance sheet accessors" do
      VCR.use_cassette('fundamentals_aapl') do
        latest = fd.financials.balance_sheet.yearly.last
        _(latest.date).must_equal('2025-09-30')
        _(latest.total_liabilities).must_equal('285508000000.00')       # totalLiab
        _(latest.capital_surplus).must_equal('93567852270.00')          # capitalSurpluse (misspelling corrected)
        _(latest.non_current_assets_other).must_equal('62950000000.00') # nonCurrrentAssetsOther (typo corrected)
      end
    end

    it "expands abbreviated income statement accessors" do
      VCR.use_cassette('fundamentals_aapl') do
        latest = fd.financials.income_statement.yearly.last
        _(latest.net_income_from_continuing_operations).must_equal('112010000000.00') # netIncomeFromContinuingOps
      end
    end

    it "returns Earnings as an Eodhd::Fundamentals::Earnings" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.earnings).must_be_kind_of(Eodhd::Fundamentals::Earnings)
      end
    end

    it "returns Earnings annual, history, and trend as arrays of typed entries" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.earnings.annual.first).must_be_kind_of(Eodhd::Fundamentals::Earnings::AnnualEntry)
        _(fd.earnings.history.first).must_be_kind_of(Eodhd::Fundamentals::Earnings::HistoryEntry)
        _(fd.earnings.trend.first).must_be_kind_of(Eodhd::Fundamentals::Earnings::TrendEntry)
        dates = fd.earnings.annual.map(&:date)
        _(dates).must_equal(dates.sort)
      end
    end

    it "returns Holders institutions and funds as arrays of typed entries" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.holders.institutions).must_be_kind_of(Array)
        _(fd.holders.funds).must_be_kind_of(Array)
        institution = fd.holders.institutions.first
        _(institution).must_be_kind_of(Eodhd::Fundamentals::Holders::Institution)
        _(institution.name).must_equal('Vanguard Group Inc')
        _(institution.change_percent).must_equal(1.9191) # change_p
      end
    end

    it "returns insider_transactions as a sorted array of InsiderTransaction" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.insider_transactions).must_be_kind_of(Array)
        _(fd.insider_transactions.first).must_be_kind_of(Eodhd::Fundamentals::InsiderTransaction)
        dates = fd.insider_transactions.map(&:date)
        _(dates).must_equal(dates.sort)
      end
    end

    it "returns outstanding_shares as OutstandingShares with typed annual and quarterly arrays" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.outstanding_shares).must_be_kind_of(Eodhd::Fundamentals::OutstandingShares)
        _(fd.outstanding_shares.annual.first).must_be_kind_of(Eodhd::Fundamentals::OutstandingShares::Entry)
        _(fd.outstanding_shares.quarterly.first).must_be_kind_of(Eodhd::Fundamentals::OutstandingShares::Entry)
      end
    end

    it "returns SharesStats as an Eodhd::Fundamentals::SharesStats" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.shares_stats).must_be_kind_of(Eodhd::Fundamentals::SharesStats)
        _(fd.shares_stats.shares_outstanding).wont_be_nil
      end
    end
  end

  describe ".all with an ASX symbol" do
    let(:fd){Eodhd::Fundamentals.all(api_token: api_token, exchange_code: 'AU', symbol: 'CBA')}

    it "wraps a real AU fundamentals payload into the same typed objects" do
      VCR.use_cassette('fundamentals_cba_au') do
        _(fd).must_be_kind_of(Eodhd::Fundamentals)
        _(fd.exchange_code).must_equal('AU')
        _(fd.symbol).must_equal('CBA')
        _(fd.general).must_be_kind_of(Eodhd::Fundamentals::General)

        _(fd.financials.balance_sheet).must_be_kind_of(Eodhd::Fundamentals::Financials::BalanceSheet)
        yearly = fd.financials.balance_sheet.yearly
        _(yearly).must_be_kind_of(Array)
        _(yearly).wont_be_empty
        _(yearly.first).must_be_kind_of(Eodhd::Fundamentals::Financials::BalanceSheet::Entry)
        dates = yearly.map(&:date)
        _(dates).must_equal(dates.sort)

        _(fd.holders.institutions).must_be_kind_of(Array)
        _(fd.insider_transactions).must_be_kind_of(Array)
        _(fd.outstanding_shares).must_be_kind_of(Eodhd::Fundamentals::OutstandingShares)
      end
    end
  end
end
