require_relative "helper"

describe Eodhd::Client do
  let(:api_token){ENV.fetch('EODHD_API_TOKEN', '<API_TOKEN>')}

  let(:client){Eodhd::Client.new(api_token: api_token)}

  describe "#exchanges_list" do
    it "exchanges_list returns parsed JSON array" do
      VCR.use_cassette("client_exchanges_list") do
        result = client.exchanges_list
        _(result).must_be_kind_of(Array)
        _(result.first["Code"]).wont_be_nil
      end
    end

    it "raises Eodhd::Error on failure" do
      VCR.use_cassette("client_exchanges_list_401_error") do
        _{client.exchanges_list}.must_raise(Eodhd::Error)
      end
    end
  end

  describe "#exchange_symbol_list" do
    it "exchange_symbol_list returns parsed JSON array" do
      VCR.use_cassette("client_exchange_symbol_list") do
        result = client.exchange_symbol_list(exchange_code: 'AU')
        _(result).must_be_kind_of(Array)
        _(result.first['Code']).wont_be_nil
      end
    end

    it "raises Eodhd::Error on failure" do
      VCR.use_cassette("client_exchange_symbol_list_401_error") do
        _{client.exchange_symbol_list(exchange_code: 'AU')}.must_raise(Eodhd::Error)
      end
    end
  end

  describe "#eod_data" do
    it "eod_data returns parsed JSON array" do
      VCR.use_cassette('client_eod_data') do
        result = client.eod_data(exchange_id: 'AU', symbol: 'BHP', period: 'd')
        _(result).must_be_kind_of(Array)
        _(result.first.keys).must_equal(%w{date open high low close adjusted_close volume})
      end
    end

    it "raises Eodhd::Error on failure" do
      VCR.use_cassette('client_eod_data_401_error') do
        _{client.eod_data(exchange_id: 'AU', symbol: 'BHP', period: 'd')}.must_raise(Eodhd::Error)
      end
    end
  end

  describe "#intraday" do
    it "intraday returns parsed JSON array" do
      VCR.use_cassette('client_intraday') do
        result = client.intraday(exchange_code: 'US', symbol: 'AAPL', interval: '5m')
        _(result).must_be_kind_of(Array)
        _(result.first.keys).must_equal(%w{timestamp gmtoffset datetime open high low close volume})
      end
    end

    it "raises Eodhd::Error on failure" do
      VCR.use_cassette('client_intraday_401_error') do
        _{client.intraday(exchange_code: 'US', symbol: 'AAPL', interval: '5m')}.must_raise(Eodhd::Error)
      end
    end
  end

  describe "#eod_bulk_last_day" do
    it "eod_bulk_last_day returns parsed JSON array" do
      VCR.use_cassette("client_eod_bulk_last_day") do
        result = client.eod_bulk_last_day(exchange_id: 'AU', date: "2024-09-30")
        _(result).must_be_kind_of(Array)
        _(result.first.keys).must_equal(%w{code exchange_short_name date open high low close adjusted_close volume})
      end
    end

    it "raises Eodhd::Error on failure" do
      VCR.use_cassette('client_eod_bulk_last_day_401_error') do
        _{client.eod_bulk_last_day(exchange_id: 'AU', date: "2024-09-30")}.must_raise(Eodhd::Error)
      end
    end
  end
end
