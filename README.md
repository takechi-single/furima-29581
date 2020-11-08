#テーブル設計

## Usersテーブル

| Column              | Type    | Options      |
| ------------------  | ------- | -------------|
| last_name           | string  | null: false  |
| last_name_reading   | string  | null: false  |
| first_name          | string  | null: false  |
| first_name_reading  | string  | null: false  |
| nickname            | string  | null: false  |
| birthday            | date    | null: false  |
| email               | string  | null: false  |
| encrypted_password  | string  | null: false  |

### Association

- has_many :items
- has_many :orders


##Itemsテーブル

| Column           | Type         | Options      |
| -----------------| ------------ | -------------|
| name             | string       | null: false  |
| text             | string       | null: false  |
| price            | integer      | null: false  |
| category         | integer      | null: false  |
| status           | integer      | null: false  |
| shipping_charge  | integer      | null: false  |
| shipping_area    | integer      | null: false  |
| shipping_date    | integer      | null: false  |

### Association

- belongs_to :user
- has_one    :orders


##Ordersテーブル

| Column           | Type         | Options                         |
| --------------   | ------------ | --------------------------------|
| user             | references   | null: false, foreign_key: true  |
| item             | references   | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item

##Addressテーブル

| Column           | Type        | Options                         |
| --------------   | ------------| --------------------------------|
| postal_code      | string      | null: false                     |
| prefecture       | integer     | null: false                     |
| city             | string      | null: false                     |
| house_number     | string      | null: false                     |
| building_name    | string      | null: false                     |
| phone_number     | string      | null: false                     |

### Association

- belongs_to :order