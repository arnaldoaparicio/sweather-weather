class BooksService
  def self.conn
    Faraday.new(url: 'http://openlibrary.org/')
  end

  def self.book_search(city, quantity)
    response = conn.get('search.json') do |request|
      request.params['q'] = city
      request.params['limit'] = quantity
    end
    # require "pry"; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
