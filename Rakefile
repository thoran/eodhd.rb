require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
  t.warning = true
end

task default: :test

namespace :cassettes do
  CASSETTE_DIR = File.expand_path("test/fixtures/vcr_cassettes", __dir__)

  desc "Delete all VCR cassettes"
  task :clear do
    if Dir.exist?(CASSETTE_DIR)
      FileUtils.rm_rf(Dir[File.join(CASSETTE_DIR, "**", "*")])
      puts "Cleared cassettes in #{CASSETTE_DIR}"
    else
      puts "Cassette dir not found: #{CASSETTE_DIR}"
    end
  end

  desc "Show cassette directory path"
  task :path do
    puts CASSETTE_DIR
  end
end
