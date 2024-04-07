## テーブル設計


## users テーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|last_name         |string|null: false              |
|first_name        |string|null: false              |
|last_name_kana    |string|null: false              |
|first_name_kana   |string|null: false              |
|birthday          |date  |null: false              |

### Association

-has_many :items
-has_many :purchases


## items テーブル

|Column       |Type       |Options                       |
|-------------|-----------|------------------------------|
|item         |string     |null: false                   |
|message      |text       |null: false                   |
|category_id  |integer    |null: false                   |
|situation_id |integer    |null: false                   |
|expense_id   |integer    |null: false                   |
|prefecture_id|integer    |null: false                   |
|until_day_id |integer    |null: false                   |
|price        |integer    |null: false                   |
|user         |references |null: false, foreign_key: true|

### Association

-has_one :purchase
-belogs_to :user



## purchases テーブル

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|item   |references|null: false, foreign_key: true|
|user   |references|null: false, foreign_key: true|

### Association

-has_one :address
-belogs_to :user
-belogs_to :item


## address テーブル

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|postcode     |string    |null: false                   |
|prefecture_id|integer   |null: false                   |
|city         |string    |null: false                   |
|block        |string    |null: false                   |
|building     |string    |                              |
|phone_number |string    |null: false                   |
|purchase     |references|null: false, foreign_key: true|

### Association
-belogs_to :purchase