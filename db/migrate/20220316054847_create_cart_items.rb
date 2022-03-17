class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.references :item, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
