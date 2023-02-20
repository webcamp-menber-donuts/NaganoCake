class Public::CartsController < ApplicationController

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
     redirect_to carts_path
    else
     render :create
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
