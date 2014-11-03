class AdventureTypesController < ApplicationController
  include SessionsHelper

  before_action :signed_in_user

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
    @adventure_type = current_user.adventure_types.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to :action => 'index' and return if !@adventure_type
    session[:adventure_type] = @adventure_type
  end

  def update
    @adventure_type = session[:adventure_type]
    if @adventure_type.update_attributes(adventure_types_params) 
      redirect_to :action => 'index'
    else 
      render 'edit'
    end
  end

  def show
    @adventure_type = current_user.adventure_types.find(params[:id])
    rescue ActiveRecord::RecordNotFound
          redirect_to :action => 'index' and return if !@adventure_type
    session[:adventure_type] = @adventure_type
  end

  def destroy
    @adventure_type = AdventureType.find(params[:id])
    @adventure_type.destroy
    redirect_to :controller => 'adventure_types', :action => 'index'
  end

  private
    def adventure_types_params
      params.require(:adventure_type).permit(:adventure_type, :user_id)
    end
end
