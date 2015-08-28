class RestaurantDetail < ActiveRecord::Base
  has_many                :addresses
  has_and_belongs_to_many :food_types, :join_table => "food_types_restaurant_details", :class => "food_type"
  has_and_belongs_to_many :cousines
end
