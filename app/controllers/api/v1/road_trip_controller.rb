class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      trip = RoadTripFacade.new(params[:origin], params[:destination])
      render :json => (trip.make_data), :status => 200
    else
      render :json => ("Invalid Credentials"), :status => 400
    end
  end
end
