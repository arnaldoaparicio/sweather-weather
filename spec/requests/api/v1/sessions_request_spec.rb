require 'rails_helper'

RSpec.describe 'Sessions API' do
  it 'creates a user session' do

    user_params = ({
      email: 'example@mail.com',
      password: 'test123',
      password_confirmation: 'test123'
      })

      headers = {'CONTENT_TYPE' => 'application/json'}
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      created_user = User.last
      expect(response.status).to eq(201)


      session_params = ({
        email: 'example@mail.com',
        password: 'test123'
        })

        post '/api/v1/sessions', headers: headers, params: JSON.generate(session: session_params)

        expect(response.status).to eq(200)
      end
    end
