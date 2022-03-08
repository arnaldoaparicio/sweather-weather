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
    created_user = User.last
    expect(response.status).to eq(201)
    # require "pry"; binding.pry
    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.api_key).to_not eq(nil)
  end

  it 'attempts to create a user with the password empty' do
    user_params = ({
      email: 'example@mail.com',
      password: '',
      password_confirmation: 'test123'
      })

      headers = {'CONTENT_TYPE' => 'application/json'}
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      created_user = User.last
      expect(response.status).to eq(400)
      expect(created_user).to eq(nil)
    end

  it 'attempts to create a user with the email empty' do
    user_params = ({
      email: '',
      password: '',
      password_confirmation: 'test123'
      })

      headers = {'CONTENT_TYPE' => 'application/json'}
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      created_user = User.last

      expect(response.status).to eq(400)
      expect(created_user).to eq(nil)
  end
end
