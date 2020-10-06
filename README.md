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
| column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| item_name         | string     | null: false       |
| item_description  | text       | null: false       |
| item_category     | integer    | null: false       |
| item_status       | integer    | null: false       |
| shopping_fee      | integer    | null: false       |
| item_prefecture   | integer    | null: false       |
| delivery_schedule | integer    | null: false       |
| item_price        | integer    | null: false       |
| user              | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

### Association
- belongs :user
- belongs_to :item
- has_one :address

## addressesテーブル
| column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | integer    | null: false       |
| prefecture   | integer    | null: false       |
| city         | string     | null: false       |
| address      | string     | null: false       |
| building     | string     |                   |
| phone_number | string     | null: false       |
| purchase     | references | foreign_key: true |

### Association
- belongs_to :purchase
