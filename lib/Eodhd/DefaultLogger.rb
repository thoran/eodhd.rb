# Eodhd/DefaultLogger.rb
# Eodhd::DefaultLogger

require 'fileutils'
require 'logger'

class Eodhd
  class DefaultLogger
    class << self
      attr_writer :log_filepath

      def default_log_filepath
        File.join(%w{~ log eodhd log.txt})
      end

      def log_filepath
        File.expand_path(@log_filepath || default_log_filepath)
      end

      def log_file
        FileUtils.mkdir_p(File.dirname(log_filepath))
        File.open(log_filepath, File::WRONLY | File::APPEND | File::CREAT)
      end

      def logger
        @logger ||= Logger.new(log_file, 'daily')
      end
    end
  end
end
