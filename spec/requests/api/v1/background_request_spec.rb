require 'rails_helper'

RSpec.describe 'Background API' do
  it 'gets the background', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    background = JSON.parse(response.body, symbolize_names: true)

    expect(background).to be_a(Hash)
    expect(background).to have_key :data

    expect(background[:data]).to have_key :id
    expect(background[:data][:id]).to eq('null')
  end
end
