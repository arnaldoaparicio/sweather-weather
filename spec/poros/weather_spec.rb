require 'rails_helper'

RSpec.describe Weather do
  it 'exists' do
    current = {
          dt: 1646827690,
          sunrise: 1646831925,
          sunset: 1646873963,
          temp: 19.69,
          feels_like: 13.08,
          humidity: 79,
          uvi: 0,
          visibility: 10000,
          weather: [icon: '01n']
    }


    

    current = CurrentWeather.new(current)
    expect(current).to be_an_instance_of(CurrentWeather)
  end
end
