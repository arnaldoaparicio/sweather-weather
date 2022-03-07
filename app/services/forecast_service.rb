class ForecastService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall') do |faraday|
      faraday.params['appid'] = ENV['weather_key']
    end
  end

  def self.weather_coordinates(latitude, longitude)
    response = conn.get do |request|
      request.params['lat'] = latitude
      request.params['lon'] = longitude
      request.params['units'] = 'imperial'
      request.params['exclude'] = 'minutely,alerts'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
