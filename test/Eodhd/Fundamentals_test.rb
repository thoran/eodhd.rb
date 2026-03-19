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

    it "returns Financials with income_statement, balance_sheet, and cash_flow" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.financials.income_statement).must_be_kind_of(Eodhd::Fundamentals::Financials::Statement)
        _(fd.financials.balance_sheet).must_be_kind_of(Eodhd::Fundamentals::Financials::Statement)
        _(fd.financials.cash_flow).must_be_kind_of(Eodhd::Fundamentals::Financials::Statement)
      end
    end

    it "returns quarterly and yearly data as hashes on financial statements" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.financials.income_statement.quarterly).must_be_kind_of(Hash)
        _(fd.financials.income_statement.yearly).must_be_kind_of(Hash)
      end
    end

    it "returns Earnings as an Eodhd::Fundamentals::Earnings" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.earnings).must_be_kind_of(Eodhd::Fundamentals::Earnings)
      end
    end

    it "returns SharesStats as an Eodhd::Fundamentals::SharesStats" do
      VCR.use_cassette('fundamentals_aapl') do
        _(fd.shares_stats).must_be_kind_of(Eodhd::Fundamentals::SharesStats)
        _(fd.shares_stats.shares_outstanding).wont_be_nil
      end
    end
  end
end
