FactoryGirl.define do
  factory :admin do
    name Faker::Name.first_name
    surname Faker::Name.last_name
    email Faker::Internet.email
    password Faker::Internet.password
  end
end
