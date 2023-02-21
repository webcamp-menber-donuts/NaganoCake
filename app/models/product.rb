class Product < ApplicationRecord
  belongs_to :product_genre
  has_one_attached :image
  has_many :carts


  has_many :order_details

  def get_image
  (image.attached?) ? image : 'no_image.jpg'
  end

  def add_tax_price
      (self.price * 1.10).round
  end

  ## 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end



end