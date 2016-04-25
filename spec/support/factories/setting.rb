FactoryGirl.define do
  factory :setting do
    name Faker::Name.first_name
    value Faker::Number.number(10)
  end
end
