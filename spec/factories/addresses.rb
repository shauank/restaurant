FactoryGirl.define do
  factory :address do
    association    :detail
    street  { Faker::Address.street_name }
    city    { Faker::Address.city_prefix  }
    state   { Faker::Address.state }
    pincode { Faker::Address.postcode}
  end
end
