# Eodhd/Fundamentals/Holders/Institution.rb
# Eodhd::Fundamentals::Holders::Institution

class Eodhd
  class Fundamentals
    class Holders
      class Institution
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
