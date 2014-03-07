class WeatherDataController < ApplicationController
  def new
    @weatherdata = WeatherData.new
  end
end
