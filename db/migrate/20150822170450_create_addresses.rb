class CreateAddresses < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.timestamps
      t.string      :street
      t.string      :city
      t.string      :state
      t.integer     :pincode
    end
  end

  def down
    drop_table :addresses
  end
end
