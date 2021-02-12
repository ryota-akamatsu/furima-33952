#usersテーブル
|  Column          | Type       | Options                 |
| ---------------- | ---------- | ------------------------|
|email             |   string   | unique: true  null:false|
|encrypted_password|   string   |    NOT NULL             |
|nickname          |   string   |    NOT NULL             |
|name              |   string   |    NOT NULL             |
|name_full_width   |   string   |    NOT NULL             |
|name_katakana     |   string   |    NOT NULL             |
|birthday          |   string   |    NOT NULL             |

### Association
- has_many :items
- has_many :orders

##itemsテーブル
|  Column          | Type       | Options                 |
| ---------------- | ---------- |  -----------------------|
|description_item  |    text    |    NOT NULL             |
|title             |   string   |    NOT NULL             |
|price             |   integer  |    NOT NULL             |
|user              | references |                         |
|category_id       |   integer  |    NOT NULL             |
|product_status_id |   integer  |    NOT NULL             |
|shipping_id       |   integer  |    NOT NULL             |
|delivery_date_id  |   integer  |    NOT NULL             |
|area_id           |   integer  |    NOT NULL             |


### Association
- has_one    :order
- belongs_to :user

##ordersテーブル
|  Column     | Type       | Options                  |
| ----------- | ---------- |  ------------------------|
|user         | references |                          |
|item         | references |                          |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

##addressテーブル
|  Column     | Type      | Options                 |
| ----------- | ---------- | -----------------------|
|postal_code  |   integer  |     NOT NULL           |
|area_id      |   integer  |     NOT NULL           |
|municipality |   string   |     NOT NULL           |
|address      |   string   |     NOT NULL           |
|building     |   string   |     NOT NULL           |
|phone_number |   string   |     NOT NULL           |
|order        | references |                        |


### Association
- belongs_to  :order