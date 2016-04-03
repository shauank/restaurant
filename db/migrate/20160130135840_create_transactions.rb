class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.references :user, index: true
      t.references :reservation, index: true
      t.string :transaction_id
      t.references :user_payment_profile, index: true

      t.timestamps
    end
  end
end
