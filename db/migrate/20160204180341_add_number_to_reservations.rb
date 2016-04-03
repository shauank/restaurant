class AddNumberToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :number, :string
  end
end
