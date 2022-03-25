class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum product_status: { cannot_product: 0, wating_product: 1, producting: 2, finish_product: 3 }
end
