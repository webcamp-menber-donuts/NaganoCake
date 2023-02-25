class Public::CartsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cart = current_customer.carts.new(cart_params)
    my_cart = current_customer.carts.find_by(product_id: @cart.product_id)
    if my_cart
      new_quantity = my_cart.quantity + @cart.quantity
      if my_cart.update(quantity: new_quantity)
        redirect_to carts_path
      else
        @product_genres = ProductGenre.all
        @product = Product.find(params[:cart][:product_id])
        @cart_error = my_cart
        render template: "public/products/show"
      end
    else
      @cart.save
      redirect_to carts_path
    end
  end

  def index
   @carts = current_customer.carts
   #↓合計金額を出すアクショ↓
   @total_price = 0 #0から始まるため「0」で指定

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
