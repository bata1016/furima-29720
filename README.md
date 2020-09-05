# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| nickname | string  | null: false |
| password | string  | null: false |
| email    | string  | null: false |
| birthday | date    | null: false |

### Association

- has_many :items
- has_one  :shoppings

## items テーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| name     | string      | null: false                    |
| price    | integer     | null: false                    |
| category | string      | null: false                    |
| user     | references  | null: false, foreign_key: true |
| shopping | references  | null: false, foreign_key: true |


### Association

- belongs_to :users 
- belongs_to :shopping

## shoppings テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| phone     | integer    | null: false                    |
| card      | integer    | null: false                    |
| address   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |


### Association

- has_many   :items
- belongs_to :users

