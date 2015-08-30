FactoryGirl.define do
  factory :food_type do
    typ   { ['African', 'Asian', 'European', 'Mediterranean', 'Middle Eastern'].sample }
  end
  
  factory :food_type_with_detail, parent: :food_type do
    after(:create) do |food_type, evaluator|
      food_type.details << FactoryGirl.create(:detail) 
    end
  end
end
