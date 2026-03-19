# Eodhd/Fundamentals/Holders.rb
# Eodhd::Fundamentals::Holders

class Eodhd
  class Fundamentals
    class Holders
      attr_reader\
        :institutions,
        :funds

      private

      def initialize(data)
        @institutions = data['Institutions']
        @funds = data['Funds']
      end
    end
  end
end
