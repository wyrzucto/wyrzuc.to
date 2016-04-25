FactoryGirl.define do
  factory :phrase do
    name Faker::Name.first_name
    fraction
  end
end
