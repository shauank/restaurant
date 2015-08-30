class CreateAddresses < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.timestamps
      t.belongs_to :detail, index:true
    end
  end
  
  def down
    drop_table :addresses
  end
end
