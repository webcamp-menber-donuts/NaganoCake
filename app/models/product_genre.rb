class ProductGenre < ApplicationRecord
  has_many :product, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true #空白でない&一意性
  
end
