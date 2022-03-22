class Address < ApplicationRecord
  belongs_to :customer
  
   validates :address_code, presence: true
   validates :post_code, presence: true
   validates :name, presence: true
   
  def address_display
  '〒' + post_code + ' ' + address_code + ' ' + name
  end
end
