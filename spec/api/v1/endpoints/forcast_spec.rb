require 'rails_helper'

RSpec.describe "as a visitor", :vcr do
  it "sees a forecast from the city" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
