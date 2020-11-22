FactoryBot.define do
  factory :item do
    image { 'image/png' }
    name { '桃ミルク' }
    text { '山梨県産の桃果汁をふんだんに使用' }
    price { '1500' }
    shipping_area_id { '1' }
    shipping_date_id { '1' }
    shipping_charge_id { '1' }
    status_id { '1' }
    category_id { '1' }
    user_id { '1' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
