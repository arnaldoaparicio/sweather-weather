class BooksFacade

  def self.get_books(city, quantity)
    books = BooksService.book_search(city, quantity)[:docs]

    books.map do |book|
      Book.new(book)
    end
  end
end
