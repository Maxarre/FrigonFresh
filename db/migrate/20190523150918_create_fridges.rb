class CreateFridges < ActiveRecord::Migration[5.2]
  def change
    create_table :fridges do |t|
      t.string :name
      t.string :address
      t.string :brand
      t.boolean :availability, default: true
      t.text :description
      t.string :photo
      t.integer :capacity
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
