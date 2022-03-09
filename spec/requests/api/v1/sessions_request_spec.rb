require 'rails_helper'

RSpec.describe 'Sessions API' do
  it 'creates a user session' do

    user = User.create!(
      email: 'example@mail.com',
      password: 'test123',
      password_confirmation: 'test123'
    )

    session_params = ({
      email: 'example@mail.com',
      password: 'test123'
      })

      post '/api/v1/sessions', headers: headers, params: session_params

      expect(response.status).to eq(200)
    end


  it 'does not create a user session' do

    user = User.create!(
      email: 'example@mail.com',
      password: 'test123',
      password_confirmation: 'test123'
    )

    session_params = ({
      email: 'example@mail.com',
      password: 'test3'
      })

      post '/api/v1/sessions', headers: headers, params: session_params

      expect(response.status).to eq(400)
    end
  end
