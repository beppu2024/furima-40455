## テーブル設計


## users テーブル

|Column------------|Type--|Options------------------|
|------------------|------|-------------------------|
|nickname----------|string|null: false--------------|
|email-------------|string|null: false, unique: true|
|encrypted_password|string|null: false--------------|

### Association

-has_many :items


## items テーブル

|Column----|Type------|Options------------------------|
|----------|----------|-------------------------------|
|image-----|references|null: false, foreign_key: true-|
|item------|string----|null: false--------------------|
|message---|text------|null: false--------------------|
|category--|string----|null: false--------------------|
|situation-|string----|null: false--------------------|
|user------|references|null: false, foreign_key: true-|
|address---|references|null: false, foreign_key: true-|

### Association

-has_one :purchase
-belogs_to :user
-belogs_to :address


## purchases テーブル

|Column-|Type--|Options----------------------------|
|-------|------|-----------------------------------|
|item---|references|null: false, foreign_key: true-|
|address|references|null: false, foreign_key: true-|

### Association

-belogs_to :item
-belogs_to :address


## address テーブル

|Column------|Type--|Options----------------------------|
|------------|------|-----------------------------------|
|postcode----|string|null: false------------------------|
|prefecture--|string|null: false------------------------|
|city--------|string|null: false------------------------|
|block-------|string|null: false------------------------|
|building----|string|-----------------------------------|
|phone_number|string|null: false------------------------|

### Association

-has_many :items
-has_one :purchase
