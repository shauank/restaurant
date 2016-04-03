require 'active_merchant'

module Payment
  autoload :Gateway, 'payment/gateway'
  autoload :Profile, 'payment/profile'
  autoload :Response, 'payment/response'
  
  module AuthorizeNet
    Name = 'authorize_net'
    autoload :Gateway, 'payment/authorize_net/gateway'
    autoload :Profile, 'payment/authorize_net/profile'
    autoload :Response, 'payment/authorize_net/response'
  end
  
  def self.profile_for_name_and_user(payment_gateway_name, user)
    profile_class = profile_class_for(payment_gateway_name)
    profile_class.find(user)
  end
  
  def self.profile_class_for(name)
    case name.to_s.downcase
    when Payment::AuthorizeNet::Name
      Payment::AuthorizeNet::Profile
    else
      raise NotImplementedError, 'Specified Gateway is not supported'
    end      
  end
end