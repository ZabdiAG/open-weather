require 'net/http'
require 'json'
require 'open-weather/Units'

module OpenWeather
  class Weather
    BASE_URL =  "http://api.openweathermap.org/data/2.5/weather"
    ACCEPTABLE_UNITS =
    [
      Units::FAHRENHEIT,
      Units::CELSIUS,
      Units::KELVIN
    ]

    attr_accessor :units, :key

    def initialize(api_key, units = Units::KELVIN)
      @key          = api_key
      @units        = units
    end

    def by_coord(lat, lon, units = @units)
      units = Units::KELVIN unless ACCEPTABLE_UNITS.include?(units)
      params = {:APPID => @key, :lat=> lat, :lon=>lon, :units => units}
      get_response params
    end

    def by_city_name(name = '', units = @units)
      units = Units::KELVIN unless ACCEPTABLE_UNITS.include?(units)
      params = {:APPID => @key, :q => name, :units => units}
      get_response params
    end

    private

    def get_response params
      uri    = URI(BASE_URL)
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      response_body = JSON.parse(res.body)
      if res.is_a?(Net::HTTPSuccess)
        result ={
          :city    => response_body['name'],
          :weather => response_body['weather'][0]['description'],
          :temp    => response_body['main']['temp']
        }
      elsif res.is_a?(Net::HTTPBadGateway)
        response_body['message']
      elsif res.is_a?(Net::HTTPUnauthorized)
        response_body['message']
      end
    end

  end
end
