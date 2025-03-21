# Eodhd/Error.rb
# Eodhd::Error

class Eodhd
  class Error < RuntimeError
    attr_reader :code, :message, :body

    private

    def initialize(code:, message:, body:)
      @code = code
      @message = message
      @body = body
    end
  end
end
