# README



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

##creditテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


##categoryAテーブル
|Column|Type|Options|
|------|----|-------|
|categoryA|string|null: false|
|products_id|string|null: false|

### Association
- has_one :products
- has_many :categoryBs

##categoryBテーブル
|Column|Type|Options|
|------|----|-------|
|categoryB|string|null: false|
|products_id|string|null: false|

### Association
- has_one :products
- belongs_to :categoryA
- has_many :categoryCs


##categoryCテーブル
|Column|Type|Options|
|------|----|-------|
|categoryC|string|null: false|
|products_id|string|null: false|

### Association
- has_one :products
- has_many :categoryBs
- has_many :sizes


##sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|categoryC_id|string|null: false|

### Association
- has_one :products
- belongs_to :categoryC


##statusテーブル
|status|string|null: false|
|products_id|string|null: false|

### Association
- has_one :products


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
