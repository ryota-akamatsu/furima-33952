#usersテーブル
|  Column          | Type       | Options       |
| ---------------- | ---------- | --------------|
|email             |   string   | unique: true  |
|encrypted_password|   string   |    NOT NULL   |
|nickname          |   string   |    NOT NULL   |
|name              |   string   |    NOT NULL   |
|name_full_width   |   string   |    NOT NULL   |
|birthday          |   string   |    NOT NULL   |

### Association
- has_many :items
- has_many :orders

##itemsテーブル
|  Column          | Type       | Options       |
| ---------------- | ---------- | --------------|
|description_item  |    text    |    NOT NULL   |
|title             |   string   |    NOT NULL   |
|price             |   integer  |    NOT NULL   |
|user              | references |               |
|category_id       |   string   |    NOT NULL   |
|product_status_id |   string   |    NOT NULL   |
|shipping_id       |   string   |    NOT NULL   |
|delivery_date_id  |   string   |    NOT NULL   |
|area_id           |   string   |    NOT NULL   |


### Association
- has_one    :orders
- belongs_to :users

##ordersテーブル
|  Column     | Type       | Options       |
| ----------- | ---------- | --------------|
|user         | references |               |
|item        | references |               |

### Association
- belongs_to :users
- belongs_to :items
- has_one    :address

##addressテーブル
|  Column     | Type       | Options       |
| ----------- | ---------- | --------------|
|postal_code  |   integer  |     NOT NULL  |
|area_id      |   string   |     NOT NULL  |
|municipality |   string   |     NOT NULL  |
|address      |   string   |     NOT NULL  |
|building     |   string   |     NOT NULL  |
|phone_number |   string   |     NOT NULL  |


### Association
- belongs_to  :orders