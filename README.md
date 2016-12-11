# open-weather
Ruby gem that consults http://openweathermap.org/ api 



### Sample

Create new Weather object, its parameters are, a valid key, from http://openweathermap.org/, and an optional parameter that indicates units of measures, like FAHRENHEIT, CELSIUS, or KELVIN, its default if is not assigned one, is KELVIN
~~~~
weather = OpenWeather::Weather.new('YOUR_KEY')
# OPTIONAL PARAMETER(units)
weather = OpenWeather::Weather.new('YOUR_KEY',  OpenWeather::Units::CELSIUS)
~~~~


You can search by coord, or by city name, both methods have units optional parameter:
~~~~
weather.by_coord(25.6866, -100.32)
weather.by_coord(25.6866, -100.32, OpenWeather::Units::FAHRENHEIT)
#or
weather.by_city_name('Monterrey')
weather.by_city_name('Monterrey', OpenWeather::Units::KELVIN)
~~~~

The response is a hash, for example:
~~~~
{:city=>"Monterrey", :weather=>"light intensity drizzle", :temp=>284.77} 
~~~~
