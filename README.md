# テーブル設計
## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| nick_name       | string  | null: false |
| password        | string  | null: false |
| email           | string  | null: false |
| birth_day       | date    | null: false |

### Association

- has_many  :items
- has_many  :orders

## items テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| name             | string      | null: false                    |
| price            | integer     | null: false                    |
| description      | text        | null: false                    |
| user             | references  | null: false  foreign_key: true |
| category_id      | integer     | null: false                    |
| delivery_fee_id  | integer     | null: false                    |
| delivery_date_id | integer     | null: false                    |
| statement_id     | integer     | null: false                    |
| prefecture_id    | integer     | null: false                    |





### Association

- has_one :order
- belongs_to :user 


## orders テーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| item     | references  | null: false  foreign_key: true |
| user     | references  | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one    :shopping

## shoppings テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

