## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true, index: true, index: true|
|name|text|null: false, index: true|
|email|text|null: false, unique: true, index: true|
|encrypted_password|text|null: false|
|sign_in_count|integer|null: false|
|current_sign_in_at|datetime|null: false|
|last_sign_in_at|datetime|null: false|
|current_sign_in_ip|integer|null: false|
|last_sign_in_ip|integer|null: false|
|createrd_at|datetime|null: false, index: true|
|updated_at|datetime|null: false|
|group_id|integer|null: false, foreign_key: true|

### Association
- has_many :groups, through:members
- has_many :messages
- has_many :members

## groupテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true, index: true|
|name|text|null: false, unique: true, index: true|

### Association
- has_many :user, through:members
- has_many :messages

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, index: true|
|text|text|
|image|text|
|createrd_at|datetime|null: false, index: true|
|updated_at|datetime|null: false|

### Association
- belongs_to :user


## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, index: true|
|group_id|integer|null: false, foreign_key: true, index: true|

### Association
- belongs_to :group
- belongs_to :user
