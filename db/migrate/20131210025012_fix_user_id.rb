class FixUserId < ActiveRecord::Migration
  def change
    rename_column :adventures, :userId, :user_id
  end
end
