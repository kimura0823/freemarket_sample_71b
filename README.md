# README DB設計

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation


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
|email|string|null: false|
|nickname|string|null: false|
|password|string|null: false|
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

## image（画像）テーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|products_id|integer|null: false|
### Association
- belongs_to :product


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
