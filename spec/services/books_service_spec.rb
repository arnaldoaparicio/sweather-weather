require 'rails_helper'

RSpec.describe BooksService do
  it 'returns coordinates by city and state', :vcr do
    search = BooksService.book_search('denver,co', 5)
    expect(search).to be_a Hash



    expect(search[:docs].count).to eq(5)
    expect(search).to have_key :numFound
    expect(search[:numFound]).to be_an Integer

    expect(search[:docs][0]).to have_key :isbn
    expect(search[:docs][0][:isbn]).to be_an Array

    expect(search[:docs][0]).to have_key :title
    expect(search[:docs][0][:title]).to be_a String

    expect(search[:docs][0]).to have_key :publiser
    expect(search[:docs][0][:publiser]).to be_an Array

    expect(search[:docs][0]).to have_key :publiser
    expect(search[:docs][0][:publiser]).to be_an Array

  end
end
