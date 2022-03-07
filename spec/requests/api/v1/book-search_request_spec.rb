require 'rails_helper'

RSpec.describe 'Book Search API API' do
  it 'gets the book info' do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    book_search = JSON.parse(response.body, symbolize_names: true)

    expect(book_search).to be_a(Hash)

    
  end
end
