require 'rails_helper'

# Coordinates are from Denver, CO
RSpec.describe ForecastFacade do
  it 'describes the current weather forecast', :vcr do
    current_weather = ForecastFacade.current_weather(39.738453, -104.984853)

    expect(current_weather).to be_a CurrentWeather
  end

  it 'describes the daily weather for five days', :vcr do

    daily_weather = ForecastFacade.daily_weather(39.738453, -104.984853)

    expect(daily_weather).to be_an Array
    expect(daily_weather.first).to be_a DailyWeather
    expect(daily_weather.count).to eq(5)

    daily_weather.each do |dw|
      expect(dw).to be_a DailyWeather
    end
  end

  it 'describes the hourly weather for eight hours' do
    hourly_weather = ForecastFacade.hourly_weather(39.738453, -104.984853)

    expect(hourly_weather).to be_an Array
    expect(hourly_weather.first).to be_a HourlyWeather
    expect(hourly_weather.count).to eq(8)

    hourly_weather.each do |hw|
      expect(hw).to be_a HourlyWeather
    end
  end

  xit 'shows all weather forecasts' do
  end
end
