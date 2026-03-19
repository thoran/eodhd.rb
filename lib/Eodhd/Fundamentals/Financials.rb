# Eodhd/Fundamentals/Financials.rb
# Eodhd::Fundamentals::Financials

require_relative './Financials/BalanceSheet'
require_relative './Financials/CashFlow'
require_relative './Financials/IncomeStatement'

class Eodhd
  class Fundamentals
    class Financials
      attr_reader\
        :income_statement,
        :balance_sheet,
        :cash_flow

      private

      def initialize(data)
        @income_statement = IncomeStatement.new(data['Income_Statement']) if data['Income_Statement']
        @balance_sheet = BalanceSheet.new(data['Balance_Sheet']) if data['Balance_Sheet']
        @cash_flow = CashFlow.new(data['Cash_Flow']) if data['Cash_Flow']
      end
    end
  end
end
