class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :post_code
      t.text :address
      t.integer :address_id
      t.integer :select_address
      t.string :name
      t.integer :postage
      t.integer :total_price
      t.integer :payment_method
      t.integer :status
      t.timestamps
    end
  end
end
