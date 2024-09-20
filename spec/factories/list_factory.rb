FactoryBot.define do
  factory :list do
    sequence(:name) { |n| "My List#{n}" }

    trait :with_books do
      after(:create) do |list|
        create_list(:book_list, 2, list: list)
      end
    end
  end
end
