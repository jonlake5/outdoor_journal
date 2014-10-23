class AdventureCoordinatesController < ApplicationController

  def destroy_all_for_adventure
    @adventure = session[:adventure]
    @adventure_coordinates = AdventureCoordinate.where(:adventure_id => @adventure.id)
    @adventure_coordinates.destroy_all
    redirect_to @adventure
  end

  def delete_coords
    @adventure = session[:adventure]
    @adventure_coordinates = AdventureCoordinate.all.where(:adventure_id => @adventure.id)
    if params[:before_or_after] == "after" 
      @adventure_coordinates.delete_all(["id > ?", params[:adv_id]])
    elsif params[:before_or_after] == "before"
      @adventure_coordinates.delete_all(["id < ?", params[:adv_id]])
    end
  end

  def edit
    @adventure = session[:adventure]
    @adventure_coordinates = AdventureCoordinate.all.where(:adventure_id => @adventure.id)
  end

end

