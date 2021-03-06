class ItemTagRelation < ApplicationRecord
  

    include ActiveModel::Model
    attr_accessor :images,:description_item,:title,:price,:category_id ,:product_status_id, :delivery_date_id,:area_id,:shipping_id,:user_id, :name
  
    with_options presence: true do
        validates :images
        validates :description_item
        validates :title
        validates :price
        validates :name

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
  
    def save
      item = Item.create(images: images,description_item: description_item,title: title,price:price,category_id:category_id ,product_status_id: product_status_id, delivery_date_id:delivery_date_id,area_id:area_id,shipping_id:shipping_id)
      tag = Tag.where(name: name).first_or_initialize
      tag.save
  
      item.TagRelation.create(item_id: item.id, tag_id: tag.id)
    end
  
  
end
