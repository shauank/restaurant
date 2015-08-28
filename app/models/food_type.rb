class FoodType < ActiveRecord::Base
   has_and_belongs_to_many :restaurant_details, :join_table => "food_types_restaurant_details", :class => "restaurant_detail"
end
