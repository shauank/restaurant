class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.timestamps
      t.string      :type
    end
  end
end
