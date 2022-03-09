class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    roadtrip = RoadTripFacade.get_roadtrip(params[:origin], params[:destination])
    if user.nil? || params[:api_key] == ''
      render json: { error: 'You must include a valid API key'}, status: 400
    else
      city_and_state = params[:destination].downcase.split(',')
      coordinates = CoordinatesFacade.get_coordinates(city_and_state[0], city_and_state[1])
      forecast = RoadTripFacade.future_weather(coordinates.latitude, coordinates.longitude, params[:origin], params[:destination])
      render json: RoadTripSerializer.road_trip(params[:origin], params[:destination], roadtrip, forecast)
    end
  end
end
