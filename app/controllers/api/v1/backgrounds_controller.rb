class Api::V1::BackgroundsController < ApplicationController
  def show
    render :json => (BackgroundService.new.generate_image(params[:location]))
  end
end
