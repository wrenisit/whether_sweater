require 'rails_helper'

RSpec.describe "as a visitor", :vcr do
  it "allows a post to register" do
    post '/api/v1/users', params: { :email => 'ex@ample.com', :password => 'password', :password_confirmation => 'password'}

    expect(response).to be_successful
    expect(response.status).to eq("201")
  end
end
