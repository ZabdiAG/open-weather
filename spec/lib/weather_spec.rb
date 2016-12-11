require 'spec_helper'

describe OpenWeather::Weather do
  INVALID_KEY_RESPONSE = "Invalid API key. Please see "\
  "http://openweathermap.org/faq#error401 for more info."
  CITY_NOT_FOUND_RESPONSE = "Error: Not found city"

  VALID_KEY  = '324bb8a6adb59dbe0afbf1784c915a1c'

  describe '#initialize' do
    context 'bad key' do
      it "returns Invalid Key message error" do
        weather = OpenWeather::Weather.new('badkey123')
        expect(weather.by_coord(223,332)).to eq INVALID_KEY_RESPONSE
      end
    end
  end

  describe '#by_coord' do
    context 'city found' do
      it 'returns json content with valid data' do
        weather = OpenWeather::Weather.new(VALID_KEY)
        expect(weather.by_coord(25.6866, -100.32)[:city]).to eq 'Monterrey'
      end
    end
    context 'city not found' do
      it 'returns city not found error message' do
        weather = OpenWeather::Weather.new(VALID_KEY)
        expect(weather.by_coord(123332, 111111)).to eq CITY_NOT_FOUND_RESPONSE
      end
    end
  end

  describe '#by_city_name' do
    context 'search for London' do
      it 'returns London city name' do
        weather = OpenWeather::Weather.new(VALID_KEY)
        expect(weather.by_city_name('London')[:city]).to eq 'London'
      end
    end
    context 'search for city that does not exists' do
      it 'returns city not found error message' do
        weather = OpenWeather::Weather.new(VALID_KEY)
        expect(weather.by_city_name('notfound')).to eq CITY_NOT_FOUND_RESPONSE
      end
    end
  end

end
