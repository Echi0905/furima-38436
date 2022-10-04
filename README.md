## Users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    | 
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| family_name        | string | null: false                    |
| first_name         | string | null: false                    |
| family_name_kana   | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birth_day          | date   | null: false                    |
| user_id            | integer| null: false, foreign_key: true |

### Association
 belongs_to :user

##  Destinationテーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| post_code          | string   | null: false                    | 
| prefecture         | string   | null: false                    |
| city               | string   | null: false                    |
| address            | string   | null: false                    |
| building_name      | string   | null: false                    |
| phone_number       | string   | null: false                    |
| user_id            | integer  | null: false                    |

##  Cardテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| user_id            | string | null: false                    | 
| product_name       | string | null: false                    |

### Association
 belongs_to :user

##  Productテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| name               | string | null: false                    | 
| description        | string | null: false                    |
| status             | string | null: false                    |
| shipping_cost      | string | null: false                    |
| shipping_days      | string | null: false                    |
| prefecture_id      | string | null: false                    |
| price              | string | null: false                    | 

