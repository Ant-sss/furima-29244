# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickame            | string   | null: false |
| email              | string   | null: false |
| password           | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_reading  | string   | null: false |
| first_name_reading | string   | null: false |
| birthday           | date     | null: false |

## itmes テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| delivery_fee | integer    | null: false                    |
| ship_from    | integer    | null: false                    |
| days         | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |


