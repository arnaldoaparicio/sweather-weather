require 'rails_helper'

RSpec.describe 'Road Trip API' do
   it 'it returns directions', :vcr do
     roadtrip = RoadTripService.roadtrip_directions('Denver, CO', 'Estes Park, CO')
    
     expect(roadtrip).to be_a Hash
   end
end
