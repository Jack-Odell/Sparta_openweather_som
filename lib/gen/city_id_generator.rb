require 'httparty'
require 'json'
require 'yaml'

class CityIdGenerator
  include HTTParty

  def initialize
    @city_id = YAML.load_file('../../city_id.yml')
  end

  def get_random_id
    @city_id.sample
  end
end
