class RemoveCoordinatesTable < ActiveRecord::Migration
  def change
  drop_table :adventure_coordinates
  end
end
