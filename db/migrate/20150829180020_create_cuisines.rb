class CreateCuisines < ActiveRecord::Migration
  def up
    create_table :cuisines do |t|
      t.timestamps
    end
    
    create_table :cuisines_details, id: false do |t|
      t.belongs_to :detail
      t.belongs_to :cuisine
    end
    
    change_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :pincode
    end
  
    change_table :food_types do |t|
      t.string :typ
    end
    
    change_table :cuisines do |t|
      t.string :typ
    end
    
    change_table :details do |t| 
      t.string :name
      t.datetime :hours_from
      t.datetime :hours_to
      t.integer :price_from
      t.integer :price_to
    end    
  end
  
  def down
    drop_table :cuisines
    drop_table :cuisines_details
    
    change_table :addresses do |t|
      t.remove :street
      t.remove :city
      t.remove :state
      t.remove :pincode
    end
  
    change_table :food_types do |t|
      t.remove :typ
    end
    
    change_table :details do |t| 
      t.remove :name, :string
      t.remove :hours_from
      t.remove :hours_to
      t.remove :price_from
      t.remove :price_to
    end    
  end
end
