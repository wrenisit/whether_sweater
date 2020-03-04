Whether, Sweater?

This application is intended to help the front end team provide data to the user on the weather and travel time to destinations. Any endpoint used with the exception of the register and forecast will require a valid account. Requests must pass the api_key with the value of your unique key.

All endpoints begin with 'https://whether-sweater-wren.herokuapp.com'
Endpoints in this app include:

Forecast:
get '/api/v1/forecast?location=<your location>'
This will provide a hash of all data needed for displaying current, hourly, daily, or weekly forecasts.

Register:
post '/api/v1/register'
Pass in parameters for registering, and the system will return your unique api key.

Login:
post '/api/v1/sessions'
Pass in parameters for logging in, and the system will return your unique api key.

Road Trip:
post '/api/v1/road_trip'
Pass in these parameters: origin, destination, and your api key. The system will return travel time, weather at the destination when you arrive, origin and destination.
