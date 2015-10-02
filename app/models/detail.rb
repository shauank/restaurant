class Detail < ActiveRecord::Base
  has_many :addresses
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :food_types
  
  scope :by_hours_from, ->(hours_from) { where('extract(hour from hours_from) > :hour', { hour: hours_from }) } 
  generate_scope
end
 