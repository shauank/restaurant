FactoryGirl.define do
  factory :detail do
    hours_from  { "#{rand(1..11)}.sample}" }
    hours_to    { "#{rand(21..23)}.sample}"}
    price_from  { rand(500..3000) }
    price_to    { rand(1000..7000) }
    name        { Faker::Company.name}
  end
end
