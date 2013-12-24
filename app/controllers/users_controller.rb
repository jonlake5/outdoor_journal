class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :index, :show]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user,     only: [:destroy]
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    redirect_to :controller => 'users', :action => 'show', :id => @user.id
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params_user)
    if @user.save
      flash[:success] = "Welcome to Outdoor Journal"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def destroy
    sign_out
    redirect_to root_url
  end

  private
    def params_user
      params.require(:user).permit(:f_name, :l_name, :email,
                                  :password, :password_confirmation,
                                  :address, :city, 
                                  :state, :zip)
    end
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in" unless signed_in?
      end
    end

    def correct_user
      @user=User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
