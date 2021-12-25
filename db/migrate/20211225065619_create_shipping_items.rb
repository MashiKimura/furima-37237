class CreateShippingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_items do |t|
      t.string      :postcode,       null: false
      t.integer     :prefecture_id,  null: false
      t.string      :city,           null: false
      t.string      :street_address, null: false
      t.string      :building
      t.string      :tel,            null: false
      t.references  :purchase_item,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
