require 'rspec'
require_relative '../lib/openweatherio'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
