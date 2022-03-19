class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def get_tax_include_price
    postage = 10
    self.total_price * (1 + postage / 100).round
  end
end
