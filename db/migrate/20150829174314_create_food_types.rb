class CreateFoodTypes < ActiveRecord::Migration
  def up
    create_table :food_types do |t|
      t.timestamps
    end
    
    create_table :details_food_types, id: false do |t|
      t.belongs_to :detail
      t.belongs_to :food_type
    end
  end
  
  def down
    drop_table :food_types
    drop_table :details_food_types
  end
end
