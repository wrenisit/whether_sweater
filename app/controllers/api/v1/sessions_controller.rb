class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if login_successful?(user)
      render :json => (user.api_key), :status => 200
    else
      render :json => ("Invalid Credentials"), :status => 400
    end
  end

  private

  def login_successful?(user)
   user && user.authenticate(params[:password])
  end
end
