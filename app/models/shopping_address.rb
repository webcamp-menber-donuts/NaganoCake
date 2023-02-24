class ShoppingAddress < ApplicationRecord
  belongs_to :customer, optional: true

  #注文時のセレクトボックス用
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
　 
  #バリデーション
  validates :name, :address, presence: true #空白でない
  validates :postal_code, length: { is: 7 } #7桁制限

end
