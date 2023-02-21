class Public::CartsController < ApplicationController

  def create
   if customer_signed_in?
    @cart = Cart.create(customer_id: current_customer.id)
    @cart = Cart.new(cart_params)
    @cart.save
    redirect_to carts_path(current_customer)
    elsif
     render :create
    else
    
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
