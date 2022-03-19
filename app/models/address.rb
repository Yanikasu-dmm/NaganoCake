class Address < ApplicationRecord
  belongs_to :customer

  def address_display
  '〒' + post_code + ' ' + address_code + ' ' + name
  end
end
