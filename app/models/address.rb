class Address < ActiveRecord::Base
  belongs_to :detail
  geocoded_by :address
  after_validation :geocode
  
  
  def address
    "#{street} #{city} #{state} #{pincode}"
  end
end
