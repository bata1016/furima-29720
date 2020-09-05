# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| nickname        | string  | null: false |
| password        | string  | null: false |
| email           | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_one  :shoppings

## items テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| name        | string      | null: false                    |
| price       | integer     | null: false                    |
| description | text        | null: false                    |
| image       | integer     | null: false                    |
| user_id     | references  | null: false, foreign_key: true |


### Association

- belongs_to :user 

## user_item テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| item_id     | references  | null: false  foreign_key: true |
| user_id     | references  | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item

## shoppings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postcode     | references | null: false                    |
| city         | references | null: false                    |
| block        | references | null: false                    |
| building     | references | null: false                    |
| phone_number | string     | null: false                    |
| address      | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user

