require 'rails_helper'

RSpec.describe 'User API' do
  it 'creates a user' do
    user_params = ({
                    email: 'example@mail.com',
                    password: 'test123',
                    password_confirmation: 'test123'
                  })

    headers = {'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

    expect(response.status).to eq(201)
  end

  it 'attempts to create a user with the password empty' do
    user_params = ({
      email: 'example@mail.com',
      password: '',
      password_confirmation: 'test123'
      })

      headers = {'CONTENT_TYPE' => 'application/json'}
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response.status).to eq(400)

    end

  it 'attempts to create a user with the email empty' do
    user_params = ({
      email: '',
      password: '',
      password_confirmation: 'test123'
      })

      headers = {'CONTENT_TYPE' => 'application/json'}
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)


      expect(response.status).to eq(400)

  end
end
