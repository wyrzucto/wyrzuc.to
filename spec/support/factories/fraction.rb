FactoryGirl.define do
  factory :fraction do
    name Faker::Name.first_name
    description Faker::Lorem.sentence
  end
end
