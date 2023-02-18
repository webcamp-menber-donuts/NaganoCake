class ProductGenre < ApplicationRecord
  has_many :product, dependent: :destroy
end
