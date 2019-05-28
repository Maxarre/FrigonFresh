class AddCoordinatesToFridges < ActiveRecord::Migration[5.2]
  def change
    add_column :fridges, :latitude, :float
    add_column :fridges, :longitude, :float
  end
end
