class Api::V1::UsersController < ApplicationController

  def create
    # binding.pry
    user = User.new(user_params)
    if user.save
      render json: UsersSerializer.new(user), status: 201
    else
      render error: { error: 'Unable to create user. Invalid and/or empty field'}, status: 400
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
