require 'rails_helper'


RSpec.describe 'Forecast API' do
  it 'gets the roadtrip data', :vcr do
    user = User.create!(
      email: 'example@mail.com',
      password: 'test123',
      password_confirmation: 'test123'
    )


    destination = ({origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: user.api_key})

      post '/api/v1/road_trip', params: destination


      expect(response.status).to eq(200)
    end
  end
