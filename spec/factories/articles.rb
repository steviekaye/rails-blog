FactoryBot.define do
  factory :article do
    title { 'My Awesome Article' }
    text { 'I am a body of text' }
    category { FactoryBot.build(:category) }
  end
end
