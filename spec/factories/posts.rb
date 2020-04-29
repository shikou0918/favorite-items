FactoryBot.define do
  factory :post do
    name {"テスト"}
    content {"紹介文"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
  end
end