# README DB設計

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|nullfalse|
|category_id|integer|null: false|
|brand|string||
|status|string|null:false|
|price|integer|null:false|
|user_id|integer|null:false|

### Association
- has_many : images
- belongs_to : category
- belongs_to : user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_y|integer|null: false|
|birthday_m|integer|null: false|
|birthday_d|integer|null: false|
|postcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|email|string|null: false, unique: true|
|nickname|string|null: false, unique: true|
|password|string|null: false, unique: true|
### Association
- has_many : credits
- has_many : products


## way（発送方法）テーブル
|Column|Type|Options|
|------|----|-------|
|way|string|null: false|
|products_id|integer|null: false|
### Association
- belongs_to : product


## burden（配送負担）テーブル
|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|
|products_id|integer|null: false|
### Association
- belongs_to :product


## area（地域）テーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|
|products_id|integer|null: false|
### Association
- belongs_to :product


## days（日数）テーブル
|Column|Type|Options|
|------|----|-------|
|days|string|null: false|
|products_id|integer|null: false|
### Association
- belongs_to :product


## creditテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|integer|null: false|
|card_id|integer|null: false|

### Association
- belongs_to :user


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer|null: false,foreign_key:true|
|size_tag|integer||

### Association
- has_many :products
- has_ancestry


## statusテーブル
|status|string|null: false|
|products_id|integer|null: false|

### Association
- belongs_to :product


## images（画像）テーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|products_id|integer|null: false|
### Association
- belongs_to :product