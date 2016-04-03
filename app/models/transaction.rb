class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :reservation
  belongs_to :user_payment_profile
end
