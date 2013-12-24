class AdventuresController < ApplicationController



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





  private
    def adventure_params
      params.require(:adventure).permit(:name, :user_id, :comments)
    end

end
