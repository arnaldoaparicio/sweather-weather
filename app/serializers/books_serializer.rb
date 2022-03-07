class BooksSerializer

  def self.books_forecast(forecast, books, book_count, city_and_state)
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": city_and_state.join(','),
          "forecast": {
            "summary": forecast.condition,
            "temperature": "#{forecast.temperature.round} F"
          },
          "total_books_found": book_count[:numFound],
          "books": books
        }
      }
    }
  end
end
