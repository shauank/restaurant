class RenameFoodTypes < ActiveRecord::Migration
  def up
#    rename_table :foodtypes, :food_types
    rename_table :restaurant_details_food_types, :food_types_restaurant_details
    rename_table :restaurant_details_cuisines, :cuisines_restaurant_details
  end

  def down
    rename_table :food_types, :foodtypes
    rename_table :food_types_restaurant_details, :restaurant_details_food_types
    rename_table :cuisines_restaurant_details, :restaurant_details_cuisines
  end
end
