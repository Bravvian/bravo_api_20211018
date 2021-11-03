FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category_#{n}" }
  end

  factory :video do
    category
    sequence(:title) { |n| "Title_#{n}" }
    file { Rack::Test::UploadedFile.new('spec/mocks/video_mock_1.mp4', 'video/mp4')  }
  end
end
