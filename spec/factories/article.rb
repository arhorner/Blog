FactoryBot.define do
  sequence :title do |n|
    "Test post #{n}"
  end

  factory :article do
    title
    text "test12345"
  end
end

