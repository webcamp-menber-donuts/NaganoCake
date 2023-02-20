class Public::CartsController < ApplicationController

  def create
   if customer_signed_in?
    @cart = Cart.create(customer_id: current_customer.id)
    @cart = Cart.new(cart_params)
   elsif @cart.save!
    redirect_to carts_path
   elsif
    redirect_to root_path #フラッシュメッセージつけて商品詳細に戻りたい
   else
    redirect_to new_customer_session_path
   end
  end

  def index
  end

  private
   #ストロングパラメータ
   def cart_params
    params.require(:cart).permit(:quantity)
   end
end
