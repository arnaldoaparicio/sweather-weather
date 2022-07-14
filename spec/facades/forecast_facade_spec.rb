require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'describes the current weather forecast', :vcr do
    # Coordinates are from Denver, CO
    current_weather = ForecastFacade.current_weather(39.738453, -104.984853)

    expect(current_weather).to be_a CurrentWeather
  end

  it 'describes the daily weather for five days', :vcr do

    daily_weather = ForecastFacade.daily_weather(39.738453, -104.984853)

    expect(daily_weather).to be_an Array
  end
end
