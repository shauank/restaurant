class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :seats
      t.date :reserved_date
      t.string :reserved_time
      t.belongs_to :user, index:true

      t.timestamps
    end
  end
end
