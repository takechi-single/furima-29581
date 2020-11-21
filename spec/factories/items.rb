FactoryBot.define do
  factory :item do
    image { 'ダウンロード.png' }
    name { '桃ミルク' }
    text { '山梨県産の桃果汁をふんだんに使用' }
    price { '1500' }
    category_id { '1' }
  end
end
