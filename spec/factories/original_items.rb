FactoryBot.define do
  factory :original_item do
    name                    { '商品名' }
    description             { '商品説明' }
    category1_id            { 2 }
    category2_id            { 2 } 
    state_id                { 2 }
    delivery_style_id       { 2 }
    prefecture_id           { 2 }
    delivery_day_id         { 2 }
    size_id                 { 2 }
    color_id                { 2 }
    price                   { 1000 }
    association :user

    after(:build) do |original_item|
      original_item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
