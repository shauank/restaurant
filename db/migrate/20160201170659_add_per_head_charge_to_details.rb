class AddPerHeadChargeToDetails < ActiveRecord::Migration
  def change
    add_column :details, :per_head_charge, :decimal, precision: 10, scale: 2
  end
end
