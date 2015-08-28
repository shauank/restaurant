class ChangeRelationship < ActiveRecord::Migration
  def up
#    drop_table :food_types_restaurant_details
#    create_table :restaurant_details_food_types, id: false do |t|
#      t.belongs_to  :restaurant_detail, index: true
#      t.belongs_to  :food_type, index: true
#    end

    create_join_table :restaurant_details, :food_types, column_options: {null: true} do |t|
      # t.index [:person_id, :community_id]
      # t.index [:community_id, :person_id]
    end
  end
  def down
  end
end
