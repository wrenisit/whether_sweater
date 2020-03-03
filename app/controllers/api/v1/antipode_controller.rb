class Api::V1::AntipodeController < ApplicationController

  def create
    antipode = AntipodeFacade.new(params[:location])
    render json: AntipodeSerializer.new(antipode.condensed_forecast)
  end
end
