class CreateRelationShip < ActiveRecord::Migration
  def up
    change_table :addresses do |t|
      t.belongs_to  :restaurant_detail, index: true
    end

    create_table :restaurant_details_cuisines do |t|
      t.belongs_to  :cuisine, index: true
      t.belongs_to  :restaurant_detail, index: true
    end

    create_table :restaurant_details_food_types do |t|
      t.belongs_to  :food_type, index: true
      t.belongs_to  :restaurant_detail, index: true
    end
  end

  def down
    drop_table :restaurant_details_cuisines
    drop_table :restaurant_details_food_types
    change_table :addresses do |t|
      drop_column :restaurant_detail
    end
  end
end
