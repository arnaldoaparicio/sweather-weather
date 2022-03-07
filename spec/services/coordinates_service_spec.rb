require 'rails_helper'

RSpec.describe CoordinatesService do
  it 'returns coordinates by city and state', :vcr do
    search = CoordinatesService.location_coordinates('denver', 'co')
    expect(search).to be_a Hash



    expect(search[:latLng]).to have_key :lat
    expect(search[:latLng][:lat]).to be_a Float
    expect(search[:latLng]).to have_key :lng
    expect(search[:latLng][:lng]).to be_a Float

  end
end
