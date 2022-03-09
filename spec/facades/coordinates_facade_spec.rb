require 'rails_helper'

RSpec.describe CoordinatesFacade do
  it 'returns coordinates based on city and state', :vcr do
    coordinates = CoordinatesFacade.get_coordinates('denver', 'co')

    expect(coordinates).to be_a Coordinate


  end
end
