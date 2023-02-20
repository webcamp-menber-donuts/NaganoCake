class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :orders, dependent: :destroy

  validates :last_name, :fast_name,:email,:address, presence: true #空白でない
  validates :kana_last_name, :kana_fast_name, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } #カタカナのみ
  validates :password, length: { minimum: 6 }, on: :create #6文字以上？
  validates :telephone_number, uniqueness: true #被りなし、一意性
  validates :postal_code, length: { is: 7 } #7桁制限

end
