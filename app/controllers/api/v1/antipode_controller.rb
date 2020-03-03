class Api::V1::AntipodeController < ApplicationController
  def create
    antipode = AntipodeFacade.new(params[:location])
    render json: AntipodeSerializer.new(antipode.make_data)
  end
end
