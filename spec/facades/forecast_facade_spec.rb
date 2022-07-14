require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'describes the current weather forecast' do
    # Coordinates are from Denver, CO
    current_weather = ForecastFacade.current_weather(39.738453, -104.984853)

    expect(current_weather).to be_a CurrentWeather
  end

  it ''
end
