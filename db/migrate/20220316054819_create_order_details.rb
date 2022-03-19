class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.references :item, foreign_key: true
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.integer :ship_status
      t.timestamps
    end
  end
end
