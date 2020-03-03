require 'rails_helper'

RSpec.describe "as a visitor", :vcr do
  it "allows a post to register" do
    post '/api/v1/users', params: { :email => 'ex@ample.com', :password => 'password', :password_confirmation => 'password'}
    user = User.last
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response).to have_http_status(:success)
    expect(user.api_key).to eq(response.body)
  end

  it "doesn't allow a post to register if bad credentials" do
    post '/api/v1/users', params: { :email => 'ex@ample.com', :password => 'badpassword', :password_confirmation => 'password'}
    expect(response.status).to eq(400)
    expect(response).to have_http_status(:bad_request)
    expect(response.body).to eq("Invalid Credentials. Please try again.")
  end

  it "doesn't allow a post to register if email is taken" do
    user = User.create(email: 'ex@ample.com', password: 'password', api_key: "bsEZs9X7eyzX3sud36H8Z2bF")
    post '/api/v1/sessions', params: { :email => 'ex@ample.com', :password => 'mypassword', :password_confirmation => 'mypassword'}
    expect(response.status).to eq(400)
    expect(response).to have_http_status(:bad_request)
    expect(response.body).to eq("Invalid Credentials")
  end
end
