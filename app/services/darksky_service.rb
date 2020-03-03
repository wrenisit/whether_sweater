class DarkskyService
  def find(code)
    forecast_data = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{code["lat"]},#{code["long"]}")
    forecast = JSON.parse(forecast_data.body)
  end

  def forecast_condensed(loc)
    forecast_hash = find(loc)
    condensed_forecast = Hash.new
    condensed_forecast["summary"] = forecast_hash["currently"]["summary"]
    condensed_forecast["current_temperature"] = forecast_hash["currently"]["temperature"]
    condensed_forecast
  end
end
