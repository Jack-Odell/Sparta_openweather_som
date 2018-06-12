require 'httparty'
require 'json'
require 'yaml'
require_relative 'city_id_generator'

class JsonCityGenerator
  include HTTParty

  def initialize
    @city_json = JSON.parse(File.read('city.list.json'))
  end

  def print_json
    @city_json
  end

  def get_id(random_id)
    @city_json.each do |hash|
      if hash['id'] == random_id
        @got_id = 'ID Match'
      end
    end
  end
end


call = JsonCityGenerator.new
# p call.print_json
call.get_id
