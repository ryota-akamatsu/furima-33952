#usersテーブル
|  Column       | Type       | Options       |
| ------------- | ---------- | --------------|
|email          |   string   |    NOT NULL   |
|password       |   string   |    NOT NULL   |
|nickname       |   string   |    NOT NULL   |
|name           |   string   |    NOT NULL   |
|name_full      |   string   |    NOT NULL   |
|birthday       |   string   |    NOT NULL   |

### Association
- has_many :items
- has_many :orders

##itemsテーブル
|  Column       | Type       | Options       |
| ------------- | ---------- | --------------|
|title          |   string   |    NOT NULL   |
|image          |   string   |    NOT NULL   |
|price          |   integer  |    NOT NULL   |
|user           | references |               |
|category       |   string   |    NOT NULL   |
|product_status |   string   |    NOT NULL   |
|shipping       |   string   |    NOT NULL   |
|delivery_date  |   string   |    NOT NULL   |
|area           |   string   |    NOT NULL   |

|p | references |               |

### Association
- has_one    :orders
- belongs_to :users

##ordersテーブル
|  Column  | Type       | Options       |
| -------- | ---------- | --------------|
|user      | references |               |

### Association
- belongs_to :users
- belongs_to :items
- has_one    :address

##addressテーブル
|  Column  | Type       | Options       |
| -------- | ---------- | --------------|
|address   |    text    |               |

### Association
- belongs_to  :orders