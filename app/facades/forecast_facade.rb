class ForecastFacade
  def self.current_weather(latitude, longitude)
    current = ForecastService.weather_coordinates(latitude, longitude)[:current]
    CurrentWeather.new(current)
  end

  def self.daily_weather(latitude, longitude)
    Forecast.weather_coordinates(latitude, longitude)[:daily].first(5).map do |daily|
      DailyWeather.new(daily)
    end

  end

  def self.hourly_weather(latitude, longitude)
    hourly = Forecast.weather_coordinates(latitude, longitude)[:hourly].first(8).map do |hourly|
      HourlyWeather.new(hourly)
    end
  end

  def self.all_weather_forecasts(latitude, longitude)
    Weather.new(ForecastService.weather_coordinates(latitude, longitude))
  end
end
