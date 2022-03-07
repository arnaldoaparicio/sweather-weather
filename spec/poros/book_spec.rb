require 'rails_helper'

RSpec.describe Book do
  it 'exists' do
    data = {
      docs: [{
      isbn: [2324334, 234234],
      title: 'The Raven Effect',
      publisher: 'Paul E. Dangerously'
    }
  ]
  }

    book = Book.new(data)

    expect(book).to be_an_instance_of(Book)
  end
end
