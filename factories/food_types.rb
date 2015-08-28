FactoryGirl.define do
  factory :food_type do
    type    { ['African', 'Asian', 'European', 'Mediterranean', 'Middle Eastern'].sample }
  end
end