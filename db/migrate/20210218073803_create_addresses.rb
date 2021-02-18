class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer    :postal_code
      t.integer    :area_id
      t.string     :municipality
      t.string     :address
      t.string     :building
      t.string     :phone_number
      t.references :order,foreign_key: true

      t.timestamps
    end
  end
end
