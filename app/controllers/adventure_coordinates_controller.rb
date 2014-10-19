class AdventureCoordinatesController < ApplicationController

  def destroy_all_for_adventure
    @adventure = session[:adventure]
    @adventure_coordinates = AdventureCoordinate.where(:adventure_id => @adventure.id)
    @adventure_coordinates.destroy_all
    redirect_to @adventure
  end

end