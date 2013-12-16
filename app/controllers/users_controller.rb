class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
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

  private
  def params_user
    params.require(:user).permit(:f_name, :l_name, :email,
                                :password, :password_confirmation,                                 :address, :city, 
                                :state, :zip)
    end


end
