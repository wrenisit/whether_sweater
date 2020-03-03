class Api::V1::UsersController < ApplicationController
  def create
    api_key = generate_api_key
    user = User.new(params_permit)
    if user.save
      user.update(api_key: api_key)
      render :json => (user.api_key), :status => 201
    else
      render :json => ("Invalid Credentials. Please try again."), :status => 400
    end
  end

  private

  def params_permit
    params.permit(:email, :password, :password_confirmation)
  end

  def generate_api_key
    SecureRandom.base58(24)
  end
end
