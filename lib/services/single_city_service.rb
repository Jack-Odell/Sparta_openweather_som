require 'httparty'
require 'json'
require 'yaml'

class SingleCityService
  include HTTParty

  base_uri 'http://api.openweathermap.org'

  def get_single_city(id, api_key)
    @single_city_data = JSON.parse(self.class.get("/data/2.5/weather?id=#{id}&APPID=#{api_key}").body)['name']
  end
end

call = SingleCityService.new

p call.get_single_city(81302, '0493594695543a0554506e3384c389e2')
