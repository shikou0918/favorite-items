FactoryBot.define do
  factory :comment do
    user
    post
    text { "テスト" }
  end
end
