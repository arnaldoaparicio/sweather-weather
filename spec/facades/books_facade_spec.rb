require 'rails_helper'

RSpec.describe BooksFacade do
  it 'returns coordinates based on city and state' do
    books = BooksFacade.get_books('denver,co', 5)
    expect(books.first).to be_a Book

    books.each do |book|
      expect(book).to be_a Book
    end
  end
end
