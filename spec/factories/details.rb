FactoryGirl.define do
  factory :detail do
    hours_from  { "#{rand(1..23)}#{['AM', 'PM'].sample}" }
    hours_to    { "#{rand(1..23)}#{['AM', 'PM'].sample}"}
    price_from  { rand(500..3000) }
    price_to    { rand(1000..7000) }
    name        { Faker::Company.name}
  end

end
