class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def subtotal #商品小計
    product.add_tax_price * quantity
  end

end
