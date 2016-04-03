class CreateUserProfile < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :provider_name
      t.string :provider_token
      t.belongs_to :user, index: true
    end
  end
end
