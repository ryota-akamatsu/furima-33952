class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many_attached :images
  has_one :order
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping
  belongs_to :delivery_date
  belongs_to :area

  with_options presence: true do
    validates :images
    validates :description_item
    validates :title
    validates :price
    
    validates_inclusion_of :price,in: 300..9999999
    validates :price,numericality: {with:/\A[0-9]+\z/, }
  
  end
  with_options numericality:  {other_than: 1}do
    validates :category_id 
    validates :product_status_id
    validates :shipping_id
    validates :delivery_date_id
    validates :area_id
  end
end
