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
|user_id|integer|null: false|
|customer_id|integer|null: false|
|card_id|integer|null: false|

### Association
- belongs_to :user


##categoryAテーブル
|Column|Type|Options|
|------|----|-------|
|categoryA|string|null: false|
|products_id|integer|null: false|

### Association
- belongs_to :product
- has_many :categoryBs

##categoryBテーブル
|Column|Type|Options|
|------|----|-------|
|categoryB|string|null: false|
|categoryA_id|integer|null: false|
|products_id|integer|null: false|


### Association
- belongs_to :product
- belongs_to :categoryA
- has_many :categoryCs


##categoryCテーブル
|Column|Type|Options|
|------|----|-------|
|categoryC|string|null: false|
|categoryB_id|integer|null: false|
|products_id|integer|null: false|

### Association
- belongs_to :product
- has_many :categoryBs
- has_many :sizes


##sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|categoryC_id|integer|null: false|
|products_id|integer|null: false|

### Association
- belongs_to :product
- belongs_to :categoryC


##statusテーブル
|status|string|null: false|
|products_id|integer|null: false|

### Association
- belongs_to :product

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
