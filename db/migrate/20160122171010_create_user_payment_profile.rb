class CreateUserPaymentProfile < ActiveRecord::Migration
  def change
    create_table :user_payment_profiles do |t|
      t.integer :payment_profile_id
      t.string :card_number
      t.belongs_to :user, index: true
    end
  end
end
