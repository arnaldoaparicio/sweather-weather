class Api::V1::ForecastController < ApplicationController
  def index
    city_and_state = params[:location].split(',')
    coordinates = CoordinatesFacade.get_coordinates(city_and_state[0], city_and_state[1])
    render json: ForecastSerializer.new(ForecastFacade.all_weather_forecasts(coordinates.latitude, coordinates.longitude))
  end
end
