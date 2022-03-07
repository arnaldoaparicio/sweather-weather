require 'rails_helper'

RSpec.describe 'Forecast API' do
  it 'returns the weather', :vcr do
    forecast = ForecastService.weather_coordinates(39.738453, -104.984853)

    expect(forecast).to be_a Hash
  end
end
