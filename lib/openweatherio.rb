require_relative 'services/single_city_service'

class Openweatherio
  def single_city_service
    SingleCityService.new
  end
end
