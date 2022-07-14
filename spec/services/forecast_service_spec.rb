require 'rails_helper'

RSpec.describe 'Forecast API' do
  it 'returns the weather', :vcr do
    forecast = ForecastService.weather_coordinates(39.738453, -104.984853)

    expect(forecast).to be_a Hash
    expect(forecast).to have_key(:current)
    expect(forecast[:current]).to have_key(:dt)
    expect(forecast[:current][:dt]).to be_an Integer
    expect(forecast[:current]).to have_key(:sunrise)
    expect(forecast[:current][:sunrise]).to be_an Integer
    expect(forecast[:current]).to have_key(:sunset)
    expect(forecast[:current][:sunset]).to be_an Integer
    expect(forecast[:current]).to have_key(:temp)
    expect(forecast[:current][:temp]).to be_a Float
    expect(forecast[:current]).to have_key(:feels_like)
    expect(forecast[:current][:feels_like]).to be_a Float
    expect(forecast[:current]).to have_key(:humidity)
    expect(forecast[:current][:humidity]).to be_an Integer
    expect(forecast[:current]).to have_key(:uvi)
    expect(forecast[:current][:uvi]).to be_a Float
    expect(forecast[:current]).to have_key(:visibility)
    expect(forecast[:current][:visibility]).to be_an Integer
    expect(forecast[:current]).to have_key(:weather)
    expect(forecast[:current][:weather]).to be_an Array
    expect(forecast[:current][:weather][0]).to have_key(:icon)
    expect(forecast[:current][:weather][0][:icon]).to be_a String

    expect(forecast).to have_key(:hourly)
    expect(forecast[:hourly][0]).to have_key(:dt)
    expect(forecast[:hourly][0][:dt]).to be_an Integer
    expect(forecast[:hourly][0]).to have_key(:temp)
    expect(forecast[:hourly][0][:temp]).to be_a Float
    expect(forecast[:hourly][0]).to have_key(:weather)
    expect(forecast[:hourly][0][:weather]).to be_an Array
    expect(forecast[:hourly][0][:weather][0]).to have_key(:description)
    expect(forecast[:hourly][0][:weather][0][:description]).to be_a String
    expect(forecast[:hourly][0][:weather][0]).to have_key(:icon)
    expect(forecast[:hourly][0][:weather][0][:icon]).to be_a String

    expect(forecast).to have_key(:daily)
    expect(forecast[:daily][0]).to have_key(:dt)
    expect(forecast[:daily][0][:dt]).to be_an Integer

    expect(forecast[:daily][0]).to have_key(:sunrise)
    expect(forecast[:daily][0][:sunrise]).to be_an Integer

    expect(forecast[:daily][0]).to have_key(:sunset)
    expect(forecast[:daily][0][:sunset]).to be_an Integer

    expect(forecast[:daily][0]).to have_key(:temp)
    expect(forecast[:daily][0][:temp]).to have_key(:min)
    expect(forecast[:daily][0][:temp][:min]).to be_a Float
    expect(forecast[:daily][0][:temp]).to have_key(:max)
    expect(forecast[:daily][0][:temp][:max]).to be_a Float
  end
end
