class Weather
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(attributes)
    @id = nil
    @current_weather = CurrentWeather.new(attributes[:current])
    @daily_weather = attributes[:daily].first(5).map { |daily| DailyWeather.new(daily) }
    @hourly_weather = attributes[:hourly].first(8).map { |hourly| HourlyWeather.new(hourly) }
  end
end
