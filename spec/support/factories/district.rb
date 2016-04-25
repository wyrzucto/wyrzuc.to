FactoryGirl.define do
  factory :district do
    name Faker::Address.state
  end
end
