FactoryBot.define do
  factory :post do
    name {"テスト"}
    content {"紹介文"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    likes_count { "1" }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end