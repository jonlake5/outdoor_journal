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
      redirect_to root_url
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
      @coords = AdventureCoordinate.new
      @coords = @adventure.adventure_coordinates.build(:lat => i.lat, :lon => i.lon, :elevation => i.elevation, :date_time => i.time)
      @coords.save
    end
#    redirect_to @adventure

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


end
