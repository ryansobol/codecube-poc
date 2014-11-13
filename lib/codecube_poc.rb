require 'bundler/setup'
require 'codecube'
require 'dotenv'

Dotenv.load

CodeCube.api_key = ENV.fetch('CODECUBE_API_KEY')

response = CodeCube.run_sync(language: 'ruby', code: <<-CODE
puts 'Ruby v' + RUBY_VERSION
puts 'RSpec v' + RSpec::Core::Version::STRING
CODE
)

puts response.text_output
