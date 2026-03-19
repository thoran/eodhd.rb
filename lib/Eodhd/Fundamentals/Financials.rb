# Eodhd/Fundamentals/Financials.rb
# Eodhd::Fundamentals::Financials

require_relative './Financials/Statement'

class Eodhd
  class Fundamentals
    class Financials
      attr_reader\
        :income_statement,
        :balance_sheet,
        :cash_flow

      private

      def initialize(data)
        @income_statement = Statement.new(data['Income_Statement']) if data['Income_Statement']
        @balance_sheet = Statement.new(data['Balance_Sheet']) if data['Balance_Sheet']
        @cash_flow = Statement.new(data['Cash_Flow']) if data['Cash_Flow']
      end
    end
  end
end
