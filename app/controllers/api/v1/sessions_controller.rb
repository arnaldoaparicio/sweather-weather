class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: { error: 'Unable to create user. Invalid and/or empty field'}, status: 400
    end
  end
end
