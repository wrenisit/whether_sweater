class Api::V1::AntipodeController < ApplicationController

  def create
    antipode = AntipodeFacade.new(params[:location]).antipode_city

  end
end
