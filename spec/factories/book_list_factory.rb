FactoryBot.define do
  factory :book_list do
    association :list
    association :book
  end
end
