# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |


### Association

- has_many :products
- has_many :address

## products テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| description            | string     | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_fee_charge_id | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| shipping_days_id       | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user_id                | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_one :buyer

## buyer テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user_id                | references | null: false, foreign_key: true |
| product_id             | references | null: false, foreign_key: true |


### Association

- has_one :products

## address テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| post_code              | integer    | null: false                    |
| prefectures            | string     | null: false                    |
| city                   | integer    | null: false                    |
| address                | integer    | null: false                    |
| building_name          | integer    | null: false                    |
| user_id                | references | null: false, foreign_key: true |

### Association

- belongs_to :users