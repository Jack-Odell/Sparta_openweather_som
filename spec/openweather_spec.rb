require 'spec_helper'
require_relative '../lib/gen/city_id_generator'


describe Openweatherio do

  context 'Testing city IDs and related weather data' do

    before(:all) do
      # @random_id = CityIdGenerator.new.get_random_id
      @city_weather = Openweatherio.new.single_city_service
      @city_weather.get_single_city(52867, '0493594695543a0554506e3384c389e2')
    end

    it 'ID should be and Integer' do
      pending
      # expect(@random_id.length).to be_kind_of(Integer)
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
end
