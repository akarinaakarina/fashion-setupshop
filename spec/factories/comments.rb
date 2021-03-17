FactoryBot.define do
  factory :comment do
    text               {'コメント'}
    association :user
    association :original_item
  end
end