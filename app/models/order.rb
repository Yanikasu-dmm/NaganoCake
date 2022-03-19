class Order < ApplicationRecord
  belongs_to :customer
  has_many :cart_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum select_addresses: { my_address: 0, registrated_address: 1, new_address: 2 }

end
