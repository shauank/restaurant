FactoryGirl.define do
  factory :cuisine do
    association    :restaurant_detail
    type    { ['African', 'Asian', 'European', 'Mediterranean', 'Middle Eastern'].sample }
  end
end