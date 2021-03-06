# DB 設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |




### Association
- has_many :items
- has_many :records


## items テーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| item_name    | string      | null: false                    |
| item_text    | text        | null: false                    |
| user         | references  | null: false, foreign_key: true |
| category_id  | integer     | null: false                    |
| condition_id | integer     | null: false                    |
| postage_id   | integer     | null: false                    |
| area_id      | integer     | null: false                    |
| days_id      | integer     | null: false                    |
| price        | integer     | null: false                    |



### Association
- belongs_to :user
- has_one :record


## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_number      | string     | null: false                    |
| area_id          | integer    | null: false                    |
| city             | string     | null: false                    |
| street_number    | string     | null: false                    |
| building         | string     |                                |
| telephone        | string     | null: false                    |
| record           | references | null: false, foreign_key: true |

### Association
- belongs_to :record