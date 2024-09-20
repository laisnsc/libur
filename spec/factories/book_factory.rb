FactoryBot.define do
  factory :book do
    sequence(:title) { Faker::Book.title }
    release_year { '1990' }

    association :author
  end
end
