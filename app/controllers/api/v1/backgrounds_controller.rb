class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundsFacade.image(params[:location])
    render json: BackgroundSerializer.image_json(background)
  end
end
