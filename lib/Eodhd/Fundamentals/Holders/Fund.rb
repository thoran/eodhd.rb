# Eodhd/Fundamentals/Holders/Fund.rb
# Eodhd::Fundamentals::Holders::Fund

class Eodhd
  class Fundamentals
    class Holders
      class Fund
        attr_reader\
          :name,
          :date,
          :total_shares,
          :total_assets,
          :current_shares,
          :change,
          :change_percent

        private

        def initialize(data)
          @name = data['name']
          @date = data['date']
          @total_shares = data['totalShares']
          @total_assets = data['totalAssets']
          @current_shares = data['currentShares']
          @change = data['change']
          @change_percent = data['change_p']
        end
      end
    end
  end
end
