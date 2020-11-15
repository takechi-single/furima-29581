FactoryBot.define do
  factory :user do
    nickname { 'koko' }
    email { 'koko@com' }
    password { 'aaaa0000' }
    password_confirmation { 'aaaa0000' }
    birthday { '2020-12-12' }
    last_name { '鈴木' }
    first_name { '洋輔' }
    last_name_reading { 'スズキ' }
    first_name_reading { 'ヨウスケ' }
  end
end
