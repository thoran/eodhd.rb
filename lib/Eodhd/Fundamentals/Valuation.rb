# Eodhd/Fundamentals/Valuation.rb
# Eodhd::Fundamentals::Valuation

class Eodhd
  class Fundamentals
    class Valuation
      attr_reader\
        :trailing_pe,
        :forward_pe,
        :price_sales_ttm,
        :price_book_mrq,
        :enterprise_value,
        :enterprise_value_revenue,
        :enterprise_value_ebitda

      private

      def initialize(data)
        @trailing_pe = data['TrailingPE']
        @forward_pe = data['ForwardPE']
        @price_sales_ttm = data['PriceSalesTTM']
        @price_book_mrq = data['PriceBookMRQ']
        @enterprise_value = data['EnterpriseValue']
        @enterprise_value_revenue = data['EnterpriseValueRevenue']
        @enterprise_value_ebitda = data['EnterpriseValueEbitda']
      end
    end
  end
end
