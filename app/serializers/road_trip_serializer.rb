class RoadTripSerializer

  def self.road_trip(origin, destination, roadtrip, forecast)
    if roadtrip.class == String

      {
        "data": {
          "id": 'null',
          "type": "roadtrip",
          "attributes": {
            "start_city": origin,
            "end_city": destination,
            "travel_time": 'impossible',
            "weather_at_eta": forecast
          }
        }
      }

    else
      {
        "data": {
          "id": 'null',
          "type": "roadtrip",
          "attributes": {
            "start_city": origin,
            "end_city": destination,
            "travel_time": roadtrip.travel_time,
            "weather_at_eta": forecast
          }
        }
      }
    end
  end
end
