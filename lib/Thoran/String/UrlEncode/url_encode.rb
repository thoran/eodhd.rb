# Thoran/String/UrlEncode/url_encode.rb
# Thoran::String::UrlEncode#url_encode

# 20160505
# 0.3.0

# Acknowledgements: I've simply ripped off and refashioned the code from the CGI module!...

# Changes since 0.2:
# 1. + Thoran namespace.

module Thoran
  module String
    module UrlEncode

      def url_encode
        self.gsub(/([^ a-zA-Z0-9_.-]+)/n) do
          '%' + $1.unpack('H2' * $1.size).join('%').upcase
        end.tr(' ', '+')
      end

    end
  end
end

String.send(:include, Thoran::String::UrlEncode)
