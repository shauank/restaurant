require 'Payment'
class CreditCard
  
  def after_initialize
    super
    self.payment_gateway_name = $config.payment.gateway_name if self.payment_gateway_name.blank?
  end
  
  def profile
    Payment.profile_for_gateway(self.payment_gateway_name)
  end
end