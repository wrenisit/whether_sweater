require 'rails_helper'

RSpec.describe "as a visitor", :vcr do
  it "gets road trip data" do
    user = User.create(email: 'ex@ample.com', password: 'password', api_key: "bsEZs9X7eyzX3sud36H8Z2bF")
    post '/api/v1/road_trip', params: { :origin => 'Denver, CO', :destination => 'Pueblo, CO', :api_key => 'bsEZs9X7eyzX3sud36H8Z2bF'}
    expected = {origin: "Denver, CO", destination: "Pueblo, CO", travel_time: "", arrival_forecast: ""}
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response).to have_http_status(:success)

  end
