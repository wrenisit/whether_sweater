class DarkskyService

  def find(code)
    forecast_hash = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{code.latitude},#{code.longitude}")
    forecast = JSON.parse(forecast_hash.body)
    binding.pry
  end
end
