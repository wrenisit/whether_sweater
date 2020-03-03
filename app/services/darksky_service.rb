class DarkskyService

  def find(code)
    forecast_hash = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{code[:lat]},#{code[:lon]}")
    forecast = JSON.parse(forecast_hash.body)
  end
end
