class AdventureTypesController < ApplicationController
  include SessionsHelper

  def new
    @adventure_types = AdventureType.new
  end
  
  def index
    @adventure_types = current_user.adventure_types.all
  end 

  def create
    @adventure_types = current_user.adventure_types.build(adventure_types_params)
    if @adventure_types.save
      flash[:success] = "Adventure Type Created"
      redirect_to @adventure_types
    else
      render 'static_pages/home'
    end
  end

  def edit
  end
  def show
    @adventure_types = current_user.adventure_types.all
  end


  private
    def adventure_types_params
      params.require(:adventure_type).permit(:adventure_type, :user_id)
    end
end