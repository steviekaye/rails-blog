FactoryBot.define do
  factory :comment do
    commenter { 'Joe Bloggs' }
    body { 'I am the body of a comment' }
    association :article
  end
end
