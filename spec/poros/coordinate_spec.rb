require 'rails_helper'

RSpec.describe Coordinate do
  it 'exists' do
    results = {
                latLng: {
                        lat: 3.342342,
                        lng: -5.23424 }
    }

    coordinate = Coordinate.new(results)

    expect(coordinate).to be_an_instance_of(Coordinate)
    expect(coordinate.latitude).to eq(3.342342)
    expect(coordinate.longitude).to eq(-5.23424)
  end
end
