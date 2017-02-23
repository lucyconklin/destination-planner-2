class WeatherForecast
  attr_reader :day,
              :weekday,
              :month,
              :high_temp,
              :low_temp,
              :weather_conditions

  def initialize(attributes)
    byebug
    @day = attributes["date"]["day"]
    @weekday = attributes["date"]["weekday"]
    @month = attributes["date"]["month"]
    @high_temp = attributes["low"]["fahrenheit"]
    @low_temp = attributes["high"]["fahrenheit"]
    @weather_conditions = attributes["conditions"]
  end

  def self.get_10_day_forecast(zipcode)
    response = WeatherService.get_10_day_forecast(zipcode)
    response.map do |forecast|
      new(forecast)
    end
  end
end
