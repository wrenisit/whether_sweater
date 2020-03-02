class DarkskyService

  def find(code)
    forecast_hash = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{code.latitude},#{code.longitude}")
    forecast = JSON.parse(forecast_hash.body)
  end

  def find_future(code, time)
    forecast_hash = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{code.latitude},#{code.longitude},#{time.to_i}?exclude=currently")
    forecast = JSON.parse(forecast_hash.body)
  end
end
