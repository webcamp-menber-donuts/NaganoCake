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
   @carts = current_customer.carts
   #↓合計金額を出すアクショ↓
   @total_price = 0 #0から始まるため「0」で指定。

  end

  #商品ごとに削除する
  def destroy
   @cart = Cart.find(params[:id])
   @cart.destroy
   redirect_to carts_path
  end

  #カート内の商品をすべて削除する
  def destroy_all
    current_customer.carts.destroy_all
    redirect_to carts_path
  end

  #商品数の変更
  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params)
    redirect_to carts_path
  end

  private
   #ストロングパラメータ
   def cart_params
    params.require(:cart).permit(:quantity, :customer_id, :product_id)
   end
end
