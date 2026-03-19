# Eodhd/Fundamentals/InsiderTransaction.rb
# Eodhd::Fundamentals::InsiderTransaction

class Eodhd
  class Fundamentals
    class InsiderTransaction
      attr_reader\
        :date,
        :owner_cik,
        :owner_name,
        :transaction_date,
        :transaction_code,
        :transaction_amount,
        :transaction_price,
        :transaction_acquired_disposed,
        :post_transaction_amount,
        :sec_link

      private

      def initialize(data)
        @date = data['date']
        @owner_cik = data['ownerCik']
        @owner_name = data['ownerName']
        @transaction_date = data['transactionDate']
        @transaction_code = data['transactionCode']
        @transaction_amount = data['transactionAmount']
        @transaction_price = data['transactionPrice']
        @transaction_acquired_disposed = data['transactionAcquiredDisposed']
        @post_transaction_amount = data['postTransactionAmount']
        @sec_link = data['secLink']
      end
    end
  end
end
