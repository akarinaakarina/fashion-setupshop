FactoryBot.define do
  factory :like do
    user_id            {1}
    original_item_id   {1}
    association :user
    association :original_item
  end
end