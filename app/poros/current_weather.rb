class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset,
              :temperature, :feels_like, :humidity,
              :uvi, :visibility, :icon, :condition

  def initialize(attributes)
    @datetime = Time.at(attributes[:dt])
    @sunrise = Time.at(attributes[:sunrise])
    @sunset = Time.at(attributes[:sunset])
    @temperature = attributes[:temp]
    @feels_like = attributes[:feels_like]
    @humidity = attributes[:humidity]
    @uvi = attributes[:uvi]
    @visibility = attributes[:visibility]
    @condition = attributes[:weather][0][:description]
    @icon = attributes[:weather][0][:icon]
  end
end
