FactoryBot.define do
  factory :user do
    nickname { 'koko' }
    email { 'koko@com' }
    password { 'aaaa00' }
    password_confirmation { 'aaaa00' }
    birthday { '2020-12-12' }
    last_name { '鈴木' }
    first_name { '洋輔' }
    last_name_reading { 'スズキ' }
    first_name_reading { 'ヨウスケ' }
  end
end
