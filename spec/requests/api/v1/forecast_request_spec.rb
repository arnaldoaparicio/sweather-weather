require 'rails_helper'

RSpec.describe 'Forecast API' do
  it 'gets the forecast based on coordinates', :vcr do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    forecasts = JSON.parse(response.body, symbolize_names: true)
    
    expect(forecasts).to be_a(Hash)

    expect(forecasts[:data][:attributes]).to have_key :current_weather

    expect(forecasts[:data][:attributes]).to have_key :hourly_weather

    expect(forecasts[:data][:attributes]).to have_key :daily_weather
  end
end
