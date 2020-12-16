FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id { 1 }
    city { '中野区中野' }
    house_number { '中野1-1' }
    building_name { '中野ハイツ' }
    phone_number { '0000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
