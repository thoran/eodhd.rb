require_relative 'helper'

class DummyIncludingValidations
  include Eodhd::Validations
end

describe "Eodhd::Validations" do
  let(:v){DummyIncludingValidations.new}

  describe "#validate_arguments" do
    it "accepts all valid arguments" do
      _{v.validate_arguments(
        exchange_code: 'AU',
        symbol: 'BHP',
        period: 'd',
        from: '2024-01-01',
        to: '2024-12-31'
      )}.must_be_silent
    end

    it "accepts exchange_id as alias for exchange_code" do
      _{v.validate_arguments(exchange_id: 'AU')}.must_be_silent
    end

    it "raises ArgumentError for invalid exchange_code" do
      _{v.validate_arguments(exchange_code: 'au')}.must_raise(ArgumentError)
    end

    it "raises ArgumentError for invalid symbol" do
      _{v.validate_arguments(symbol: 'bad$')}.must_raise(ArgumentError)
    end

    it "raises ArgumentError for invalid period" do
      _{v.validate_arguments(period: 'h')}.must_raise(ArgumentError)
    end

    it "raises ArgumentError for invalid from date" do
      _{v.validate_arguments(from: '2024/01/01')}.must_raise(ArgumentError)
    end

    it "raises ArgumentError for invalid to date" do
      _{v.validate_arguments(to: '2024-02-30')}.must_raise(ArgumentError)
    end

    it "raises ArgumentError for reversed date range" do
      _{v.validate_arguments(from: '2024-12-31', to: '2024-01-01')}.must_raise(ArgumentError)
    end

    it "accepts nil values for all arguments" do
      _{v.validate_arguments}.must_be_silent
    end
  end

  describe "#validate_exchange_code" do
    it "accepts valid exchange codes" do
      _{v.validate_exchange_code('AU')}.must_be_silent
      _{v.validate_exchange_code('XETRA')}.must_be_silent
    end

    it "rejects invalid exchange codes" do
      _{v.validate_exchange_code('us')}.must_raise(ArgumentError)
      _{v.validate_exchange_code('U')}.must_raise(ArgumentError)
      _{v.validate_exchange_code('TOOLONG')}.must_raise(ArgumentError)
    end
  end

  describe "#validate_symbol" do
    it "accepts valid symbols" do
      _{v.validate_symbol('AAPL')}.must_be_silent
      _{v.validate_symbol('BRK.B')}.must_be_silent
      _{v.validate_symbol('RDS-A')}.must_be_silent
    end

    it "rejects invalid symbols" do
      _{v.validate_symbol('')}.must_raise(ArgumentError)
      _{v.validate_symbol(' ')}.must_raise(ArgumentError)
      _{v.validate_symbol('THIS_SYMBOL_IS_TOO_LONG')}.must_raise(ArgumentError)
      _{v.validate_symbol('bad$')}.must_raise(ArgumentError)
    end
  end

  describe "#validate_period" do
    it "accepts valid periods" do
      _{v.validate_period('d')}.must_be_silent
      _{v.validate_period('w')}.must_be_silent
      _{v.validate_period('m')}.must_be_silent
    end

    it "rejects invalid periods" do
      _{v.validate_period('h')}.must_raise(ArgumentError)
      _{v.validate_period('')}.must_raise(ArgumentError)
    end
  end

  describe "#validate_interval" do
    it "accepts valid intervals" do
      _{v.validate_interval('1m')}.must_be_silent
      _{v.validate_interval('5m')}.must_be_silent
      _{v.validate_interval('1h')}.must_be_silent
      _{v.validate_interval('1d')}.must_be_silent
    end

    it "rejects invalid intervals" do
      _{v.validate_interval('2m')}.must_raise(ArgumentError)
      _{v.validate_interval('invalid')}.must_raise(ArgumentError)
      _{v.validate_interval('')}.must_raise(ArgumentError)
    end
  end

  describe "#validate_date" do
    it "accepts valid date formats and Date objects" do
      _{v.validate_date('2024-09-30')}.must_be_silent
      _{v.validate_date(Date.new(2024,9,30))}.must_be_silent
    end

    it "rejects invalid dates and formats" do
      _{v.validate_date('2024/09/30')}.must_raise(ArgumentError)
      _{v.validate_date('2024-02-30')}.must_raise(ArgumentError)
      _{v.validate_date(12345)}.must_raise(ArgumentError)
    end
  end

  describe "#validate_date_range" do
    it "accepts valid date ranges" do
      _{v.validate_date_range('2024-01-01','2024-12-31')}.must_be_silent
      _{v.validate_date_range(Date.new(2024,1,1),Date.new(2024,12,31))}.must_be_silent
    end

    it "rejects reversed date ranges" do
      _{v.validate_date_range('2024-12-31','2024-01-01')}.must_raise(ArgumentError)
    end
  end
end
