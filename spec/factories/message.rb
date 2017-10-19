FactoryGirl.define do
  factory :message do
    association :group
    association :user
    text { Faker::Lorem.word }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

    # after(:create) do |user|
    #   temp_group = create(:group)
    #   create(:message, user: user, group: temp_group)
    #   create(:member, user: user, group: temp_group)
    # end
  end
end
