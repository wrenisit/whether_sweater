class Api::V1::RoadTripController < ApplicationController
  def create
    trip = RoadTripFacade.new(params[:origin], params[:destination])
    render :json => (trip.make_data), :status => 200
  end
end
