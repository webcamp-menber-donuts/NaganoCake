class ProductGenre < ApplicationRecord
  has_many :product, dependent: :destroy
  
  validates :name, presence: true #空白でない
  
end
