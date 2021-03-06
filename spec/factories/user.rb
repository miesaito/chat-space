FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }

    after(:create) do |user|
      temp_group = create(:group)
      create(:message, user: user, group: temp_group)
      create(:member, user: user, group: temp_group)
    end
  end

end
