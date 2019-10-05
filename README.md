# README

This README would normally document whatever steps are necessary to get the
application up and running.

最終課題 データベース設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string|
|birth_year|integer|
|birth_month|integer|
|birth_day|integer|
|buyer_id|integer|
|seller|integer|


### Association
- has_many :items
- has_many :images
- has_many :comments
- has_many :status
- has_many :evalutions
- has_many :likes
- has_many :credit_cards
- belongs_to :address


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|
|price|integer|
|size|string|
|condition|string|
|delivery_fee|integer|
|shipping_method|string|
|indication|string|
|description|text|


### Association
- has_many :images
- has_many :comments
- has_many :likes
- has_many :categories
- belongs_to :user
- belongs_to :status
- belongs_to :brand

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|


### Association
- belongs_to :item

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|


### Association
- belongs_to :item
- belongs_to :user

## evalutionsテーブル

|Column|Type|Options|
|------|----|-------|
|good|string|
|normal|string|
|bad|string|


### Association
- belongs_to :user

## evalutionsテーブル

|Column|Type|Options|
|------|----|-------|
|good|string|
|normal|string|
|bad|string|


### Association
- belongs_to :user

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|post_address|integer|
|prefecture|string|
|city|string|
|house_number|integer|
|building_name|string|


### Association
- belongs_to :user

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|

### Association
- has_many :brands

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|path|integer|
|category|string|


### Association
- belongs_to :item

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|
|number|integer|
|expiration_date|integer|


### Association
- belongs_to :user

## statusesテーブル

|Column|Type|Options|
|------|----|-------|
|exhibiting|string|
|during_trading|string|
|sold|string|


### Association
- has_many :item
- belongs_to :user
