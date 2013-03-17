class AddLongitudeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :string
    add_column :users, :lattitude, :string
  end
end
