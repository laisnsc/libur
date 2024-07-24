FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::Name.name }
    sequence(:password) { Faker::Internet.password }
    login_name { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
  end
end
