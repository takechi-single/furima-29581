#テーブル設計

## Usersテーブル

| Column        | Type    | Options      |
| --------------| ------- | -------------|
| name          | string  | null: false  |
| name_reading  | string  | null: false  |
| nickname      | string  | null: false  |
| birthday      | string  | null: false  |
| mail_address  | string  | null: false  |
| password      | string  | null: false  |

### Association

- has_many :items
- has_many :orders


##Itemsテーブル

| Column        | Type     | Options      |
| --------------| -------- | -------------|
| item_image    | text     | null: false  |
| item_name     | string   | null: false  |
| item_text     | string   | null: false  |
| price         | integer  | null: false  |

### Association

- belongs_to :users
- has_many   :orders

##Statusテーブル

| Column           | Type         | Options                         |
| --------------   | ------------ | --------------------------------|
| category         | integer      | null: false                     |
| shipping_charge  | integer      | null: false                     |
| shipping_area    | integer      | null: false                     |
| shipping_date    | integer      | null: false                     |
| item             | references   | null: false, foreign_key: true  |

### Association

- belongs_to :items


##Ordersテーブル

| Column           | Type         | Options                         |
| --------------   | ------------ | --------------------------------|
| user             | references   | null: false, foreign_key: true  |
| item             | references   | null: false, foreign_key: true  |

### Association

- belongs_to :users
- belongs_to :items

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

- belongs_to :orders