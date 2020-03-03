require 'rails_helper'

RSpec.describe "as a visitor", :vcr do
  it "sees a forecast from the city on the antipode of the earth" do
    get '/api/v1/antipode?location=Hong Kong'

    expected = {
    "data": [
        {
            "id": "null",
            "type": "antipode",
            "attributes": {"location_name": "Antipode City Name",
                "forecast": {
                    "summary": "Mostly Cloudy",
                    "current_temperature": "72",
                                },
            "search_location": "Hong Kong"
            }
        }
    ]
}
    expect(response).to be_successful
  end
end
