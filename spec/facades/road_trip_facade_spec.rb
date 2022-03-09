require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'returns coordinates based on city and state', :vcr do
    roadtrip = RoadTripFacade.get_roadtrip('Denver,CO', 'Pueblo,CO')

    expect(roadtrip).to be_a RoadTrip
  end

  it 'returns coordinates based on', :vcr do
    forecast = RoadTripFacade.future_weather(38.265425, -104.610415, 'denver,co', 'pueblo,co')
    expect(forecast).to be_a Hash
  end
end
