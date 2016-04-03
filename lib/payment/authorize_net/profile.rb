require 'payment'

module Payment
  module AuthorizeNet
    class Profile < Payment::Profile
      class << self
        def find(user)
          @user = user if user
          if(provider_token = user.profiles.try(:first).try(:provider_token))
            @profile ||= gateway.find_profile(provider_token)
          else
            @profile ||= create(user)
          end
        end
        
        def create(user)
          new_profile = gateway.create_profile({
            user_email: user.email,
            user_name: user.email,
            user_id: user.id
          })
        
          UserProfile.create(user_id: user.id, provider_name: Payment::AuthorizeNet::Name, provider_token: new_profile.id)
          return new_profile
        end
        
        def gateway
          @gateway ||= Payment::AuthorizeNet::Gateway.new
        end
      end
       
      def initialize(id)
        @id = id
      end
      
      def purchase(profile_id, payment_id, amount)
        gateway.charge(profile_id, payment_id, amount)
      end
      
      def get_all_credit_cards(owner)
        profile_id = owner.profile_id
        credit_card_responses = owner.payment_profile_ids.collect do |payment_profile_id|
          Payment::AuthorizeNet::Response.new(gateway.get_customer_payment_profile(profile_id, payment_profile_id))
        end
        credit_card_responses.map do |response|
          response.card_number
        end
      end
      
      def add_credit_card(owner, info = {})
        response = gateway.create_customer_payment_profile(info[:profile_id], info[:credit_card])
        if(response.success?)
          UserPaymentProfile.create(user_id: owner.id, payment_profile_id: response.profile_id)
        end
        response
      end
    end
  end
end