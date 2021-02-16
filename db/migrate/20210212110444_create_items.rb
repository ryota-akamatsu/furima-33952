class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :description_item
      t.string :title
      t.integer :price
      t.references :user,foreign_key: true
      t.integer :category_id
      t.integer :product_status_id
      t.integer :shipping_id
      t.integer :delivery_date_id
      t.integer :area_id


      t.timestamps
    end
  end
end
