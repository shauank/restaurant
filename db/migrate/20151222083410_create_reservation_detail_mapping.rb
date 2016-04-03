class CreateReservationDetailMapping < ActiveRecord::Migration
  def change
    change_table :reservations do |t|
      t.belongs_to :detail, index:true
    end
  end
end
