class Order < ApplicationRecord
   belongs_to :customer
   has_many :order_details, dependent: :destroy
   
  def product_quantity #購入した商品の個数の合計
      order_details.sum(:quantity)
  end
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
end
