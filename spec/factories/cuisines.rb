FactoryGirl.define do
  factory :cuisine do
    typ    { ['African', 'Asian', 'European', 'Mediterranean', 'Middle Eastern'].sample }
  end
  
  factory :cuisine_with_detail, parent: :cuisine do
    
    ignore do 
      num_details 10
    end
    
    after(:create) do |cuisine, evaluator|
      evaluator.num_details.times do 
        a = FactoryGirl.create(:address)
        cuisine.details << a.detail 
      end
    end
  end
end
