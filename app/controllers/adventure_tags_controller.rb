class AdventureTagsController < ApplicationController
  include SessionsHelper

  def new
    @adv_tag = AdventureTag.new
  end

  def create
    @adventure = session[:adventure]
    @user = current_user
    @user_defined_tag = UserDefinedAdventureTag.where(:user_id => @user.id, :tag=> params[:adventure_tag][:new_tag]).first_or_create
    @adv_tag = AdventureTag.new
    if AdventureTag.where(:adventure_id  => @adventure.id , :user_defined_adventure_tag_id => @user_defined_tag.id).count > 0 
      @adv_tag.destroy
      redirect_to @adventure
    else
      @adv_tag.user_defined_adventure_tag_id = @user_defined_tag.id
      @adv_tag.adventure_id = @adventure.id
      @adv_tag.save
      redirect_to @adventure
    end
  end
  def destroy
    @adventure = session[:adventure]
    @adv_tag = AdventureTag.find(params[:id])
    @adv_tag.destroy
    redirect_to @adventure

  end

  def update
  end

  def edit
  end
end
