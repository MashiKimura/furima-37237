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
| year                | integer | null: false               |
| month               | integer | null: false               |
| date                | integer | null: false               |

### Association
- has_many :items


## items テーブル
| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| name                | string      | null: false                    |
| explanation         | text        | null: false                    |
| category            | string      | null: false                    |
| situation           | string      | null: false                    |
| delivery            | string      | null: false                    |
| address             | string      | null: false                    |
| days                | integer     | null: false                    |
| price               | integer     | null: false                    |
| user_id             | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :sold_item

## sold_items テーブル
| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| postcode            | string      | null: false                    |
| prefecture          | string      | null: false                    |
| city                | string      | null: false                    |
| street_address      | string      | null: false                    |
| building            | string      |                                |
| tel                 | integer     | null: false                    |
| item_id             | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
