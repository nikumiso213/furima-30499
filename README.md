## usersテーブル

| column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| name         | string  | null: false |
| name_reading | string  | null: false |
| birthday     | integer | null: false |

### Association
- has_many :items
- has_many :transactions

## itemsテーブル
| column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| item_name         | string     | null: false |
| item_description  | text       | null: false |
| item_category     | string     | null: false |
| item_status       | string     | null: false |
| shopping_fee      | string     | null: false |
| item_prefecture   | string     | null: false |
| delivery_schedule | string     | null: false |
| item_price        | integer    | null: false |
| user              | references |             |

### Association
- belongs_to :user
- has_one :transaction

## transactions
| column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| address      | string     | null: false |
| building     | string     | null: false |
| phone_number | string     | null: false |
| user         | references |             |
| item         | references |             |

### Association
- belongs_to :user
- belongs_to :item
