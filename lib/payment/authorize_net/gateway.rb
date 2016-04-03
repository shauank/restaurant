require 'payment'

module Payment
  module AuthorizeNet
    class Gateway < Payment::Gateway
      
      def create_profile(attributes = {})
        response = am_gateway.create_customer_profile(profile: {
          email: attributes[:user_email],
          description: attributes[:user_name],
          merchant_customer_id: attributes[:user_id],
        })
        
        if response.success?
          Payment::AuthorizeNet::Profile.new(response.params['customer_profile_id'])
        else
          raise InvalidProfileError, response
        end
      end
      
      def create_customer_payment_profile(profile_id, cc, info = {})
        response = am_gateway.create_customer_payment_profile({
                  customer_profile_id: profile_id,
                  :payment_profile => {
                    :customer_type => 'individual',
                    :bill_to => info[:address] || {},
                    :payment => {
                      :credit_card => ActiveMerchant::Billing::CreditCard.new(number: cc[:card_number], month: cc[:month], year: cc[:year])
                    }
                  }
                })
        
                
        output_response = Payment::AuthorizeNet::Response.new(response)
        output_response.profile_id = response.params['customer_payment_profile_id']
        output_response
      end
      
      def get_customer_payment_profile(profile_id, payment_profile_id)
        am_gateway.get_customer_payment_profile({
          customer_profile_id: profile_id,
          customer_payment_profile_id: payment_profile_id
        })
      end
      
      def find_profile(identifier)
        response = am_gateway.get_customer_profile(customer_profile_id: identifier)
        
        if response.success?
          Payment::AuthorizeNet::Profile.new(response.params['profile']['customer_profile_id'])
        else
          nil
        end
      end
      
      def charge(profile_id, payment_profile_id, amount)
        response = am_gateway.create_customer_profile_transaction({
          transaction: {
            type: :auth_capture,
            amount: amount,
            customer_profile_id: profile_id,
            customer_payment_profile_id: payment_profile_id,
          }
        })
        Payment::AuthorizeNet::Response.new(response)
      end
      
      def am_gateway
        @am_gateway ||= ActiveMerchant::Billing::AuthorizeNetCimGateway.new(am_credentials)
      end
      
      def am_credentials
        am_credentials ||= {
          login: $config.payment.gateway.authorize_ctm.login_id,
          password: $config.payment.gateway.authorize_ctm.password,
          test: $config.payment.gateway.authorize_ctm.is_test?
        }
      end
    end
  end
end