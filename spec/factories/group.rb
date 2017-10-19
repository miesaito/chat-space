FactoryGirl.define do
  factory :group do
    name { Faker::Name.name }
  end
end

FactoryGirl.define do
  factory :groups do
    name { Faker::Name.name }
  end
end
