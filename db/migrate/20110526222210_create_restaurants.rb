class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name
      t.boolean :deliver
      t.integer :rank
      t.boolean :walk
      t.string :phone
      t.string :address
      t.string :menu
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
