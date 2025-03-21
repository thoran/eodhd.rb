Gem::Specification.new do |spec|
  spec.name = 'eodhd.rb'

  spec.version = '0.14.0'
  spec.date = '2025-03-21'

  spec.summary = "Access the eodhd.com API with Ruby."
  spec.description = "Access the eodhd.com API with Ruby."

  spec.author = 'thoran'
  spec.email = 'code@thoran.com'
  spec.homepage = 'http://github.com/thoran/eodhd.rb'
  spec.license = 'Ruby'

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency('http.rb')
  spec.files = [
    'eodhd.rb.gemspec',
    'Gemfile',
    Dir['lib/**/*.rb'],
    'README.md',
    Dir['test/**/*.rb']
  ].flatten
  spec.require_paths = ['lib']
end
