class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: roadtrip_params[:api_key])
    roadtrip = RoadTripFacade.get_roadtrip(roadtrip_params[:origin], roadtrip_params[:destination])
    if user.nil? || roadtrip_params[:api_key] == ''
      render json: { error: 'You must include a valid API key'}, status: 400
    else
      city_and_state = roadtrip_params[:destination].downcase.split(',')
      coordinates = CoordinatesFacade.get_coordinates(city_and_state[0], city_and_state[1])
      forecast = RoadTripFacade.future_weather(coordinates.latitude, coordinates.longitude, roadtrip_params[:origin], roadtrip_params[:destination])
      render json: RoadTripSerializer.road_trip(roadtrip_params[:origin], roadtrip_params[:destination], roadtrip, forecast)
    end
  end

  private
  def roadtrip_params
    params.require(:road_trip).permit(:origin, :destination, :api_key)
  end
end
