FactoryBot.define do
  factory :item do
    item_name          { '商品名' }
    item_text          { Faker::Lorem.sentence }
    category_id        { 2 }
    condition_id       { 2 }
    postage_id         { 2 }
    area_id            { 2 }
    days_id            { 2 }
    price              { 500 }
    association :user

    after(:build) do |items|
      items.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
