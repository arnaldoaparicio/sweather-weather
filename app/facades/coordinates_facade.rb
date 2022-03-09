class CoordinatesFacade

  def self.get_coordinates(city, state)
    coordinates = CoordinatesService.location_coordinates(city, state)
    Coordinate.new(coordinates)
  end
end
