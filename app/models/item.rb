class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping
  belongs_to :delivery_date
  belongs_to :area

  with_options presence: true do
    validates :image,presence:  {message: 'Image cant be black'}
    validates :description_item,presence:  {message: 'Description_item cant be black'}
    validates :title,presence:  {message: 'Title cant be black'}
    validates :price,presence:  {message: 'Price cant be black'}
    validates :category_id, numericality: { other_than: 1 ,message: 'Category cant be black'} 
    validates :product_status_id, numericality: { other_than: 1 ,message: 'Product_stayus cant be black'} 
    validates :shipping_id, numericality: { other_than: 1 ,message: 'Shipping cant be black'} 
    validates :delivery_date_id, numericality: { other_than: 1 ,message: 'Delivery_date cant be black'} 
    validates :area_id, numericality: { other_than: 1 ,message: 'Area cant be black'} 

    validates_inclusion_of :price,in: 300..9999999, message: 'out of setting range'
    validates :price,format:{with:/\A[0-9]+\z/}
  end
end
