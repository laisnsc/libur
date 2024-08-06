FactoryBot.define do
  factory :author do
    sequence(:name) { Faker::Book.author }
    sequence(:nationality) { Faker::Nation.nationality }
  end
end