FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category_#{n}" }
  end

  factory :video do
    category
    sequence(:title) { |n| "Title_#{n}" }
  end
end
