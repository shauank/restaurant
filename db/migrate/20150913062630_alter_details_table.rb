class AlterDetailsTable < ActiveRecord::Migration
  def up
    change_column :details, :hours_from, :string
    change_column :details, :hours_to, :string 
  end
  
  def down
    change_column :details, :hours_from, :datetime
    change_column :details, :hours_to, :datetime
  end
end
