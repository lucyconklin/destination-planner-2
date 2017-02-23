class WeatherService
  def self.get_10_day_forecast(zipcode)
    response = Faraday.get("http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/forecast10day/q/#{zipcode}.json")
    JSON.parse(response.body)["forecast"]["simpleforecast"]["forecastday"]
  end
end
