require 'configuration'

$config = Configuration.for('app') do
  app{
    name 'restaurent'
  }

  api{
    secure true
  }
  
  payment{
    gateway_name 'authorize_net'
  }
  
  
end

if File.exists?(file = File.expand_path("../envs/#{Rails.env}.rb", __FILE__))
  require file
end