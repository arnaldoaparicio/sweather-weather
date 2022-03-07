require 'rails_helper'

RSpec.describe 'Forecast API' do
  xit 'gets the forecast based on coordinates', :vcr do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    forecasts = JSON.parse(response.body, symbolize_names: true)

    expect(forecasts).to be_a(Hash)

    expect(forecasts).to have_key :current

    expect(forecasts).to have_key :hourly

    expect(forecasts).to have_key :daily
  end
end
