class Item < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many :cart_items
  has_many :order_details
  
  has_one_attached :image
end
