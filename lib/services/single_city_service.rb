require 'httparty'
require 'json'
require 'yaml'

class SingleCityService
  include HTTParty

  base_uri 'http://api.openweathermap.org'

  def get_single_city(id, api_key)
    @single_city_data = JSON.parse(self.class.get("/data/2.5/weather?id=#{id}&APPID=#{api_key}").body)
  end

  def get_city_name
    @single_city_data['name']
  end

  def get_longitude
    @single_city_data['coord']['lon']
  end

  def get_latitude
    @single_city_data['coord']['lat']
  end

  def get_id
    @single_city_data['id']
  end

  def get_id_length
    @single_city_data['id'].length
  end
end
