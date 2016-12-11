require 'spec_helper'

describe OpenWeather::Units do
  describe 'constants' do
    it 'should have FAHRENHEIT, KELVIN and CELSIUS' do
      expect(OpenWeather::Units::FAHRENHEIT).to eq 'imperial'
      expect(OpenWeather::Units::CELSIUS).to eq 'metric'
      expect(OpenWeather::Units::KELVIN).to eq ''
    end

  end

end
