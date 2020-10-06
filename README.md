## usersテーブル

| column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| family_name         | string  | null: false |
| first_name          | string  | null: false |
| family_name_reading | string  | null: false |
| first_name_reading  | string  | null: false |
| birthday            | date    | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| name                 | string     | null: false       |
| description          | text       | null: false       |
| category _id         | integer    | null: false       |
| status_id            | integer    | null: false       |
| shopping_fee_id      | integer    | null: false       |
| item_prefecture_id   | integer    | null: false       |
| delivery_schedule_id | integer    | null: false       |
| item_price           | integer    | null: false       |
| user                 | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
| column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association
- belongs_to :purchase
