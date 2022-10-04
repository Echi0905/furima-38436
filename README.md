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

### Association
 has_many :product
 has_many :card

##  Destinationsテーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| post_code          | string   | null: false                    | 
| prefecture_id      | integer  | null: false                    |
| city               | string   | null: false                    |
| address            | string   | null: false                    |
| building_name      | string   |                                |
| phone_number       | string   | null: false                    |
| card               | string   | null: false, foreign_key:true  |

##  Cardsテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| user_id            | string | null: false, foreign_key:true  | 
| product_name       | string | null: false, foreign_key:true  | 

### Association
 belongs_to :user

##  Productsテーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| user               | references | null: false, foreign_key:true  | 
| name               | string     | null: false                    | 
| description        | string     | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_days_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| price              | intefer    | null: false                    | 

