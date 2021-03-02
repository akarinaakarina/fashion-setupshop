# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false  unique: true |
| encrypted_password   | string | null: false               |
| last_name            | string | null: false               |
| first_name           | string | null: false               |
| last_kana            | string | null: false               |
| first_kana           | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :original_items
- has_many :select_items
- has_many :buys

## original_items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| description        | text        | null: false                    |
| state_id           | integer     | null: false                    |
| category1_id       | integer     | null: false                    |
| category2_id       | integer     | null: false                    |
| size_id            | integer     | null: false                    |
| delivery_style_id  | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| delivery_day_id    | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false  foreign_key: true |

### Association

- has_one :buy
- belongs_to :user

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false  foreign_key: true |
| original_item | references | null: false  foreign_key: true |
| select_item   | references | null: false  foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :original_item
- belongs_to :select_item

## address テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | string     | null: false                   |
| prefecture_id   | integer    | null: false                   |
| municipality    | string     | null: false                   |
| address         | string     | null: false                   |
| building_name   | string     |                               |
| phone_number    | string     | null: false                   |
| buy             | references | null: false  foreign_key: true|

### Association

- belongs_to :buy