class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates  :description_item
    validates  :title
    validates  :price
    validates  :category_id
    validates  :product_status_id
    validates  :shipping_id
    validates  :delivery_date_id
    validates  :area_id
  end
end
