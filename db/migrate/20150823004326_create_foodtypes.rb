class CreateFoodtypes < ActiveRecord::Migration
  def change
    create_table :foodtypes do |t|
      t.timestamps
      t.string      :type
    end
  end
end
