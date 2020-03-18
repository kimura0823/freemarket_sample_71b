# README

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
|categoryA_id|integer|null: false|
|categoryB_id|integer|null: false|
|categoryC_id|integer|null: false|
|size_id|integer|null:false|
|brand|string||
|status|string|null:false|
|burden_id|integer|null: false|
|area_id|integer|null:false|
|days_id|integer|null:false|
|price|integer|null:false|
|way_id|integer|null:false|
|stop|integer|null:false|


### Association
- has_one : area
- has_one : way
- has_one : burden
- has_one : days
- has_one : status
- has_many : images
- has_one : categoryA
- has_one : categoryB
- has_one : categoryC
- has_one : size
- belongs_to : user



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
