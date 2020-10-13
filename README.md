# README

## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday       | date    | null: false |

### Association

- has_many :comments
- has_many :purchases
- has_many :items

## itemsテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| delivery_source_id | integer    | null: false |
| delivery_days_id   | integer    | null: false |
| price              | integer    | null: false |
| user               | references |             |

### Association

- has_many :comments
- belongs_to :user
- has_many :purchases

## addressテーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| postal_code   | string     | null: false  |
| prefecture_id | integer    | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  |
| build_name    | string     |              |
| tel           | string     | null: false  |

### Association

- belongs_to :purchases

## purchasesテーブル

| Column | Type       | Options      |
| ------ | ---------- | ------------ |
| user   | references |              |
| item   | references |              |

belongs_to :user
belongs_to :item
has_one :address

## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| item      | references |             |

### Association

- belongs_to :user
- belongs_to :item