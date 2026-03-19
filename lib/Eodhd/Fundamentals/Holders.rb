# Eodhd/Fundamentals/Holders.rb
# Eodhd::Fundamentals::Holders

require_relative './Holders/Institution'
require_relative './Holders/Fund'

class Eodhd
  class Fundamentals
    class Holders
      attr_reader\
        :institutions,
        :funds

      private

      def initialize(data)
        @institutions = wrap(data['Institutions'], Institution)
        @funds = wrap(data['Funds'], Fund)
      end

      def wrap(entries, entry_class)
        return [] unless entries
        entries.values.map{|entry| entry_class.new(entry)}
      end
    end
  end
end
