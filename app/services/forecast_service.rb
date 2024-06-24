class ForecastService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/3.0/onecall')
  end

  def self.weather_coordinates(latitude, longitude)
    response = conn.get do |request|
      request.params['lat'] = latitude
      request.params['lon'] = longitude
      request.params['units'] = 'imperial'
      request.params['exclude'] = 'minutely,alerts'
      request.params['appid'] = ENV['weather_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
