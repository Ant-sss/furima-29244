# テーブル設計

## users テーブル

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| nickame      | string   | null: false |
| email        | string   | null: false |
| password     | string   | null: false |
| name_full    | string   | null: false |
| name_reading | string   | null: false |
| birthday     | integer | null: false |

## itmes テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| image     | string     | null: false                    |
| item_name | string     | null: false                    |
| text      | text       | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | default: ""                    |
| phone_num     | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


