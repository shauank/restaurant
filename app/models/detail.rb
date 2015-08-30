class Detail < ActiveRecord::Base
  has_many :addresses
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :food_types
end
