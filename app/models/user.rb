require 'payment'


class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
        
  # attr_accessible :roles
  has_many  :reservations 
  has_many  :profiles, foreign_key: :user_id, class_name: 'UserProfile'
  has_many  :payment_profiles, foreign_key: :user_id, class_name: 'UserPaymentProfile'

  ROLES = %w[super_admin admin guest]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
  
  def profile_id
    @profile_id ||= profiles.try(:first).provider_token
  end
  
  def payment_profile_ids
    payment_profiles.map{|p| p.payment_profile_id}
  end
  
  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end
  
  def super_admin?
    is?("super_admin")
  end
  
  def add_credit_card(card_number, expiry_month, expiry_year)
    response = profile.add_credit_card(self, build_hash(card_number, expiry_month, expiry_year))
    puts response.message
  end
  
  def get_credit_cards
    profile.get_all_credit_cards(self)
  end
  
  def purchase(payment_id, amount)
    response = profile.purchase(profile_id, payment_id, amount)
    
    transaction = Transaction.new(transaction_id: response.transaction_id)
    transaction.user = self
    transaction.user_payment_profile_id = payment_id
    transaction.amount = amount
    
    [response, transaction]
  end
  
  def build_hash(card_number, expiry_month, expiry_year)
    {
      credit_card: {
                      card_number: card_number,
                      month:  expiry_month,
                      year: expiry_year
                    },
      profile_id: profile_id
    }
  end
  
  def profile
    Payment::profile_for_name_and_user($config.payment.gateway_name,self)
  end
end
