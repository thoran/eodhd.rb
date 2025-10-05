require_relative "helper"

Dir[File.expand_path("./**/*_test.rb", __dir__)].each do |file|
  require file
end
