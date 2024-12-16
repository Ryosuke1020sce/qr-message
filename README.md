# README

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |

## Association

- has_many :messages

## messages テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| to             | string     |             |
| date           | string     |             |
| from           | string     |             |
| permit_comment | boolean    | null: false |
| user           | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_many :letters
- has_many :comments


## letters テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| message    | references | null: false, foreign_key: true |

## Association

- belongs_to :message


## comments テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| from       | string     |             |
| message    | references | null: false, foreign_key: true |

## Association

- belongs_to :message
