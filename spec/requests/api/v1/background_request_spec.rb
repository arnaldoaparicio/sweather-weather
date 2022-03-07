require 'rails_helper'

RSpec.describe 'Background API' do
  it 'gets the background' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    background = JSON.parse(response.body, symbolize_names: true)

    expect(backgrounds).to be_a(Hash)
  end
end
