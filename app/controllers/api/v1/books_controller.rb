class Api::V1::BooksController < ApplicationController
  def index
    books = BooksFacade.get_books(params[:location], params[:quantity])
    city_and_state = params[:location].split(',')
    coordinates = CoordinatesFacade.get_coordinates(city_and_state[0], city_and_state[1])
    forecast = ForecastFacade.current_weather(coordinates.latitude, coordinates.longitude)
    book_count = BooksService.book_search(params[:location], params[:quantity])
    render json: BooksSerializer.books_forecast(forecast, books, book_count, city_and_state)
  end  
end
