class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def subtotal #商品小計
    product.add_tax_price * quantity
  end

  validates :quantity, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 20}

end
