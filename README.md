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
 has_many :products
 has_many :cards

##  Destinationsテーブル

<<<<<<< Updated upstream
| Column             | Type      |Options                        |
| ------------------ | --------- |------------------------------ |
| post_code          | string  null:false                       | 
| prefecture_id      | integer   | null:false                    |
| city               | string    | null:false                    |
| address            | string    | null:false                    |
| building_name      |string    |                                |
| phone_number       | string    | null:false                    |
| card               | references| null: false,foreign_key:true  |
=======
| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| post_code          | string | null: false                    | 
| prefecture         | string | null: false                    |
| city               | string | null: false                    |
| address            | string | null: false                    |
| building_name      | string | null: false                    |
| phone_number       | string | null: false                    |
| user_id            | string | null: false                    |
>>>>>>> Stashed changes

### Association
 belongs_to :card

##  Cardsテーブル

| Column             | Type       Options                        |
| ------------------ | --------- |------------------------------ |
| user               | references | null: false, foreign_key:true  | 
| product            | references | null: false, foreign_key:true  | 

### Association
 belongs_to :user
<<<<<<< Updated upstream
 belongs_to :product
 has_one :destination

##  Productsテーブル

| Column             | Type       Options                        |
| ------------------ | ----------|------------------------------ |
| user               | references | null: false, foreign_key:true  | 
| name               | string     | null: false                    | 
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| price              | integer    | null: false                    | 

### Association
 belongs_to :user
 has_one :card
=======
 
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

>>>>>>> Stashed changes
