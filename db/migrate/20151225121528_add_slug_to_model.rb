class AddSlugToModel < ActiveRecord::Migration
  def change
    add_column :details, :slug, :string
    add_column :reservations, :slug, :string
    add_column :users, :slug, :string
    add_column :addresses, :slug, :string
  end
end
