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

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| item_name | string      | null: false                    |
| item_text | string      | null: false                    |
| user      | references  | null: false, foreign_key: true |
| category  | string      | null: false                    |
| condition | string      | null: false                    |
| postage   | string      | null: false                    |
| area      | string      | null: false                    |
| days      | string      | null: false                    |
| price     | integer     | null: false                    |


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
- belongs_to :address
- belongs_to :item

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_number   | integer | null: false |
| prefectures   | string  | null: false |
| city          | string  | null: false |
| street_number | string  | null: false |
| building      | string  |             |
| telephone     | integer | null: false |


### Association
- has_one :record