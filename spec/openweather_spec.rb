require 'spec_helper'
require_relative '../lib/gen/city_id_generator'
require_relative '../lib/gen/json_city_generator'

describe Openweatherio do

  context 'Testing function outputs' do

    before(:all) do
      @openweather_class = Openweatherio.new
      @random_class = CityIdGenerator.new
    end

    it 'Generator should return and array from .yml file' do
      expect(@random_class.get_array).to be_kind_of(Array)
    end

    it 'city_id.yml should contain generated ID' do
      expect(@random_class.get_array).to include(@random_class.get_random_id)
    end
  end

  context 'Testing city IDs in city_id.yml related to weather data and openweather API' do

    before(:all) do
      @random_id = CityIdGenerator.new.get_random_id
      @city_weather = Openweatherio.new.single_city_service
      @city_weather.get_single_city(@random_id, '0493594695543a0554506e3384c389e2')
    end

    it 'ID should be the same as random generated ID' do
      expect(@city_weather.get_id).to eq(@random_id)
    end

    it 'ID should be and Integer' do
      expect(@city_weather.get_id).to be_kind_of(Integer)
    end

    it 'ID should be between 5 and 8 in length' do
      expect(@city_weather.get_id_length).to be_between(5, 8)
    end

    it 'City name should be a string' do
      expect(@city_weather.get_city_name).to be_kind_of(String)
    end

    it 'Longitude should contain a float' do
      expect(@city_weather.get_longitude).to be_kind_of(Float)
    end

    it 'Latitude should contain a float' do
      expect(@city_weather.get_latitude).to be_kind_of(Float)
    end
  end

  context 'Checking JSON file against YAML file'  do

    before(:all) do
      @json_output = JsonCityGenerator.new
      @random_id = CityIdGenerator.new.get_random_id
    end

    it 'ID from JSON file and YAML file should match' do
        expect(@json_output.get_id).to eq(@random_id)
    end
  end
end
