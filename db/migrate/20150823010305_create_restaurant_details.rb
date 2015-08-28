class CreateRestaurantDetails < ActiveRecord::Migration
  def up
    create_table :restaurant_details do |t|
      t.string   :name
      t.datetime :hours_from
      t.datetime :hours_to
      t.integer  :price_from
      t.integer  :price_to
      t.timestamps
    end
  end

  def down
    drop_table :restaurant_details
  end
end
