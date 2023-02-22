class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  ## 小計を求めるメソッド
def subtotal
    product.with_tax_price * (quantity.to_i)
end

end
