class RoadTripFacade

  def self.get_roadtrip(from, to)
    roadtrip = RoadTripService.roadtrip_directions(from, to)
    if roadtrip[:route][:routeError][:errorCode] == 2
      'Impossible route'
    else
      RoadTrip.new(roadtrip)
    end
  end

  def self.future_weather(latitude, longitude, origin, destination)
    hourly = ForecastService.weather_coordinates(latitude, longitude)
    roadtrip = RoadTripService.roadtrip_directions(origin, destination)

    index = (roadtrip[:route][:time].to_f / 3600).round - 1
    if roadtrip[:route][:routeError][:errorCode] == 2
      'Impossible route'
    else
      { temperature: hourly[:hourly][index][:temp], conditions: hourly[:hourly][index][:weather][0][:description] }
    end
  end
end
