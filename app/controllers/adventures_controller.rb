class AdventuresController < ApplicationController
  include SessionsHelper
  before_action :signed_in_user

  def new
    @adventure = Adventure.new
  end

  def test
  end

  def create
    @adventure = current_user.adventures.build(adventure_params)
    if @adventure.save
      flash[:success] = "Adventure Created"
      redirect_to @adventure
    else
      render 'static_pages/home'
   end
  end

  def edit
  end

  def show
    @adventure = current_user.adventures.find(params[:id])
    @user = current_user
    session[:adventure] = @adventure
    @coords = @adventure.adventure_coordinates.to_a
    @gon_lat_array =  Array.new
    @gon_lon_array = Array.new
    @coords.each  do |i|
      @gon_lat_array.push i.lat
      @gon_lon_array.push i.lon
    end
    gon.lat_array = @gon_lat_array
    gon.lon_array = @gon_lon_array
  end

  def index
    @adventures = current_user.adventures
    @user = current_user
  end
  
  def upload
  end


  
  def parse

    @gpx = GPX::GPXFile.new(:gpx_file => (params[:coords][:uploaded_file].path))
    @adventure = session[:adventure]
    @gpx.tracks.first.points.each do |i|
      #@coords = AdventureCoordinate.new  # Don't need this line with the build statment
      @coords = @adventure.adventure_coordinates.build(:lat => i.lat, :lon => i.lon, :elevation => i.elevation, :date_time => i.time)
      @coords.save

    end
    @startcity = get_city_info(@adventure.adventure_coordinates.first.lat,@adventure.adventure_coordinates.first.lon)
    @endcity = get_city_info(@adventure.adventure_coordinates.last.lat,@adventure.adventure_coordinates.last.lon)
    @adventure.closestCityStart = @startcity
    @adventure.closestCityEnd = @endcity
    @adventure.save
#    redirect_to @adventure
#    redirect_to :controller=>'WeatherData', :action=>

  end

  private
    def adventure_params
      params.require(:adventure).permit(:name, :user_id, :comments)
    end


  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in" unless signed_in?
    end
  end

  def get_city_info(lat,lon)
    url="http://api.wunderground.com/api/c99fea409bd14281/geolookup/q/#{lat},#{lon}.json"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    result = JSON.parse(data)
    city = result['location']['city']
    state = result['location']['state']
    "#{city}, #{state}" 
  end


end
