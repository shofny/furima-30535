# README

## usersテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| first_name  | string  | null: false |
| last_name   | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_day   | integer | null: false |

### Association

- has_many :comments
- has_many :purchases
- has_many :items

## itemsテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item            | string     | null: false |
| description     | text       | null: false |
| seller          | text       | null: false |
| category        | string     | null: false |
| status          | string     | null: false |
| shipping_fee    | string     | null: false |
| delivery_source | string     | null: false |
| delivery_days   | string     | null: false |
| price           | integer    | null: false |
| user            | references |             |

### Association

- has_many :comments
- belongs_to :user
- has_one :purchases

## purchasesテーブル

| Column        | Type       | Options                     |
| ------------- | ---------- | --------------------------- |
| sold          | string     | null: false, default: false |
| credit_number | integer    | null: false                 |
| credit_month  | integer    | null: false                 |
| credit_year   | integer    | null: false                 |
| credit_code   | integer    | null: false                 |
| postal_code   | string     | null: false                 |
| prefecture    | string     | null: false                 |
| city          | string     | null: false                 |
| address       | string     | null: false                 |
| build_name    | string     |                             |
| tel           | string     | null: false                 |
| user          | references |                             |
| item          | references |                             |

### Association

- belongs_to :user
- belongs_to :item

## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| item      | references |             |

### Association

- belongs_to :user
- belongs_to :item