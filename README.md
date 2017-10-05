## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|name|text|null: false|
|email|text|null: false, unique: true|
|encrypted_password|text|null: false|
|sign_in_count|integer|null: false|
|current_sign_in_at|datetime|null: false|
|last_sign_in_at|datetime|null: false|
|current_sign_in_ip|integer|null: false|
|last_sign_in_ip|integer|null: false|
|createrd_at|datetime|null: false|
|updated_at|datetime|null: false|
|group_id|integer|null: false, foreign_key: true|

## groupテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|group_name|text|null: false, unique: true|

### Association
- has_many :user
- has_many :messages

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|text|text|null: false|
|image|text|null: false|
|createrd_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :user
h

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
