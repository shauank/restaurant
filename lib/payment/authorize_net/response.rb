require 'payment'

module Payment
  module AuthorizeNet
    class Response < Payment::Response
      
      attr_accessor :profile_id
      
      def message
        gateway_response.message
      end
      
      def transaction_id
        gateway_response.authorization
      end
      
      def success?
        gateway_response.success?
      end
      
      def card_number
        gateway_response.
          params.
          with_indifferent_access[:payment_profile][:payment][:credit_card][:card_number] rescue nil
      end
      
      # def transaction_id
#         gateway_response.
#           with_indifferent_access[:transaction_id] rescue nil
#       end
    end
  end
end