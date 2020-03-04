class DarkskyService

  def find(code)
    forecast_hash = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{code[:lat]},#{code[:lon]}")
    forecast = JSON.parse(forecast_hash.body)
  end

  def forecast_condensed(code, time)
    forecast_hash = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{code.latitude},#{code.longitude},#{time.to_i}")
    condensed_forecast = Hash.new
    condensed_forecast["summary"] = forecast_hash["currently"]["summary"]
    condensed_forecast["current_temperature"] = forecast_hash["currently"]["temperature"]
    condensed_forecast
  end
end
