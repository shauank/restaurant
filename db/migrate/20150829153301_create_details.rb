class CreateDetails < ActiveRecord::Migration
  def up
    create_table :details do |t|
      t.timestamps
    end
  end
  
  def down
    drop_table :details
  end
end
