class ShoppingAddress < ApplicationRecord
  belongs_to :customer, optional: true
  
  #注文時のセレクトボックス用
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
  
end
