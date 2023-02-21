class Public::CartsController < ApplicationController

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
     redirect_to carts_path
    else
     @product = Product.find(params[:cart][:product_id])
     @product_genres = ProductGenre.all
     render template: "public/products/show"
    end
  end
  
  

  def index
  end

  private
   #ストロングパラメータ
   def cart_params
    params.require(:cart).permit(:quantity, :customer_id, :product_id)
   end
end
