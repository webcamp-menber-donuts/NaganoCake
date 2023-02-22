class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  enum product_status: { start_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3 }
  
  def subtotal #商品小計
    product.add_tax_price * (quantity.to_i)
  end
end
