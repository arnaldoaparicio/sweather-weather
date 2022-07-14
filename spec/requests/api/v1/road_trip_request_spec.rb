require 'rails_helper'

RSpec.describe 'Forecast API' do
  it 'gets the roadtrip data', :vcr do
    user = User.create!(
      email: 'example@mail.com',
      password: 'test123',
      password_confirmation: 'test123'
    )

    destination = ({origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: user.api_key})

      post '/api/v1/road_trip', params: destination

      road_trip_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(road_trip_data[:data]).to have_key(:id)
      expect(road_trip_data[:data]).to have_key(:attributes)

      expect(road_trip_data[:data][:attributes]).to have_key(:start_city)
      expect(road_trip_data[:data][:attributes]).to have_key(:end_city)
      expect(road_trip_data[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip_data[:data][:attributes]).to have_key(:weather_at_eta)

      expect(road_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end

    it 'does not have a valid API key', :vcr do
      user = User.create!(
        email: 'example@gmail.com',
        password: 'blah',
        password_confirmation: 'blah'
      )

      destination = ({origin: 'Denver, CO',
        destination: 'Pueblo, CO',
        api_key: 'this_is_a_key'})

      
      post '/api/v1/road_trip', params: destination
      
      road_trip_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      expect(road_trip_data).to have_key(:error)
      expect(road_trip_data[:error]).to eq('You must include a valid API key')
    end
  end
