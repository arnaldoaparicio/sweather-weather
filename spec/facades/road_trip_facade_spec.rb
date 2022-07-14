require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'returns travel time between two cities', :vcr do
    roadtrip = RoadTripFacade.get_roadtrip('Denver,CO', 'Pueblo,CO')
    expect(roadtrip).to be_a RoadTrip

  end
  
  it 'returns future weather conditions', :vcr do
    forecast = RoadTripFacade.future_weather(38.265425, -104.610415, 'denver,co', 'pueblo,co')

    expect(forecast).to be_a Hash

    expect(forecast).to have_key(:temperature)
    expect(forecast).to have_key(:conditions)
  end

  it 'does not return travel time', :vcr do 
    roadtrip = RoadTripFacade.get_roadtrip('Denver,CO', 'London,UK')
    
    expect(roadtrip).to be_a String
    expect(roadtrip).to eq('Impossible route')
  end

  it 'does not return future weather conditions', :vcr do
    forecast = RoadTripFacade.future_weather(38.265425, -104.610415, 'denver,co', 'london,uk')

    expect(forecast).to be_a String 
    expect(forecast).to eq('Impossible route')
  end
end
