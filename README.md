# テーブル設計

## users テーブル
| Column              | Type    | Options                   |
| ------------------- |---------| ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| nickname            | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_ruby      | string  | null: false               |
| first_name_ruby     | string  | null: false               |
| birth_day           | date    | null: false               |

### Association
- has_many :items
- has_many :purchase_items

## items テーブル
| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| name                | string      | null: false                    |
| explanation         | text        | null: false                    |
| category_id         | integer     | null: false                    |
| situation_id        | integer     | null: false                    |
| delivery_id         | integer     | null: false                    |
| prefecture_id       | integer     | null: false                    |
| shipping_day_id     | integer     | null: false                    |
| price               | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_item

## purchase_items テーブル
| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| user                | references  | null: false, foreign_key: true |
| item                | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_item

## shipping_items テーブル
| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| postcode            | string      | null: false                    |
| prefecture_id       | integer     | null: false                    |
| city                | string      | null: false                    |
| street_address      | string      | null: false                    |
| building            | string      |                                |
| tel                 | string      | null: false                    |
| purchase_item       | references  | null: false, foreign_key: true |

### Association
- belongs_to :purchase_item
