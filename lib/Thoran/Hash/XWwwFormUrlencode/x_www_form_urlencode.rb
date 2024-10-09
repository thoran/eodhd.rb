# Thoran/Hash/XWwwFormUrlEncode/x_www_form_urlencode.rb
# Thoran::Hash::XWwwFormUrlEncode#x_www_form_urlencode

# 20241009
# 0.2.0

# Changes since 0.1:
# -/0: (The class name and the snake case name are consistent now.)
# 1. /XWWWFormUrlEncode/XWwwFormUrlEncode/

require 'Thoran/String/UrlEncode/url_encode'

module Thoran
  module Hash
    module XWwwFormUrlEncode

      def x_www_form_url_encode(joiner = '&')
        inject([]){|a,e| a << "#{e.first.to_s.url_encode}=#{e.last.to_s.url_encode}" unless e.last.nil?; a}.join(joiner)
      end
      alias_method :x_www_form_urlencode, :x_www_form_url_encode

    end
  end
end

Hash.send(:include, Thoran::Hash::XWwwFormUrlEncode)
