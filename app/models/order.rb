class Order < ApplicationRecord
  belongs_to :customer
  has_many :cart_items, dependent: :destroy
  
  

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wating_payment: 0, confirming: 1, producting: 2, preparation: 3, shipped: 4 }


  
end
