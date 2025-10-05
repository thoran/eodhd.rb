# Eodhd/Validations.rb
# Eodhd::Validations

class Eodhd
  module Validations
    def validate_arguments(exchange_code: nil, exchange_id: nil, symbol: nil, period: nil, from: nil, to: nil, date: nil)
      exchange_code ||= exchange_id
      validate_exchange_code(exchange_code)
      validate_symbol(symbol)
      validate_period(period)
      validate_date(from, 'from')
      validate_date(to, 'to')
      validate_date_range(from, to)
    end

    def validate_exchange_code(exchange_code)
      return unless exchange_code
      unless exchange_code.match?(/\A[A-Z]{2,6}\z/)
        raise ArgumentError, "Invalid exchange_code '#{exchange_code}'. Must be 2-6 uppercase letters"
      end
    end

    def validate_symbol(symbol)
      return unless symbol
      if symbol.strip.empty?
        raise ArgumentError, "Symbol cannot be empty"
      end
      unless symbol.match?(/\A[A-Za-z0-9.-]{1,12}\z/)
        raise ArgumentError, "Invalid symbol '#{symbol}'. Must be 1-12 characters, letters/numbers/dots/hyphens only"
      end
    end

    def validate_period(period)
      return unless period
      valid_periods = %w[d w m]
      unless valid_periods.include?(period)
        raise ArgumentError, "Invalid period '#{period}'. Must be one of: #{valid_periods.join(', ')}"
      end
    end

    def validate_date(date, param_name = 'date')
      return unless date
      case date
      when Date
        return
      when String
        unless date.match?(/\A\d{4}-\d{2}-\d{2}\z/)
          raise ArgumentError, "Invalid #{param_name} '#{date}'. Must be in format 'yyyy-mm-dd'"
        end
        begin
          Date.parse(date)
        rescue Date::Error
          raise ArgumentError, "Invalid #{param_name} '#{date}'. Not a valid date"
        end
      else
        raise ArgumentError, "Invalid #{param_name}. Must be String in 'yyyy-mm-dd' format or Date object"
      end
    end

    def validate_date_range(from, to)
      return unless from && to
      from_date = from.is_a?(Date) ? from : Date.parse(from.to_s)
      to_date = to.is_a?(Date) ? to : Date.parse(to.to_s)
      if from_date > to_date
        raise ArgumentError, "from date (#{from}) cannot be after to date (#{to})"
      end
    end
  end
end
