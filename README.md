# README

## usersテーブル

| Column           | Type   | Options     |
|------------------|--------|-------------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | string | null: false |

### Association

- has_many :items
- has_many :Purchases



## itemsテーブル

| Column            | Type       | Options                         |
|-------------------|------------|---------------------------------|
| items_name        | string     | null: false                     |
| image             | string     | null: false                     |  
| description       | string     | null: false                     |
| category          | string     | null: false                     |
| status            | string     | null: false                     |
| shipping_charges  | string     | null: false                     |
| shipping_from     | string     | null: false                     |
| days_for_shipping | string     | null: false                     |
| price             | string     | null: false                     |
| commission        | string     | null: false                     |
| profit            | string     | null: false                     |
| user_id           | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :purchase



## purchasesテーブル

| Column              | Type       | Options                         |
|---------------------|------------|---------------------------------|
| item_name_id        | references | null: false, foreign_key: true  |
| image_id            | references | null: false, foreign_key: true  |
| price_id            | references | null: false, foreign_key: true  |
| shipping_charges_id | references | null: false, foreign_key: true  |
| user_id             | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :items
- belongs_to :address



## addressesテーブル

| Column         | Type       | Options                         |
|----------------|------------|---------------------------------|
| postal_code    | string     | null: false                     |
| prefectures    | string     | null: false                     |  
| municipalities | string     | null: false                     |
| address        | string     | null: false                     |
| building_name  | string     | null: false                     |
| phone_number   | string     | null: false                     |
| purchase_id    | references | null: false, foreign_key: true  | 

### Association
- belongs_to :purchase