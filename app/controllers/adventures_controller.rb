class AdventuresController < ApplicationController

  def new
    @adventure = Adventure.new
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
    @adventures = current_user.adventures
    @user = current_user
  end

  def index
    @adventures = current_user.adventures
    @user = current_user
  end

  private
    def adventure_params
      params.require(:adventure).permit(:name, :user_id, :comments)
    end

end
