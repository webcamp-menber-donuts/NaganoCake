class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @shopping_addresses = current_customer.shopping_addresses
  end

  def check
    @order = Order.new(order_params)
    
    if params[:order][:address_number] == "0"
      @order.name = current_customer.full_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_number] == "1"
      @order.name = ShoppingAddress.find(params[:order][:shopping_addresses]).name
      @order.postal_code = ShoppingAddress.find(params[:order][:shopping_addresses]).postal_code
      @order.address = ShoppingAddress.find(params[:order][:shopping_addresses]).address
    elsif params[:order][:address_number] == "2"
      @shopping_address = ShoppingAddress.new
      @shopping_address.name = @order.name
      @shopping_address.postal_code = @order.postal_code
      @shopping_address.address = @order.address
      @shopping_address.customer_id = current_customer.id
      @shopping_address.save
    end
    
    #カートの計算
    @carts = current_customer.carts.all
    @total = @carts.inject(0) { |sum, item| sum + item.subtotal }
    @postage = 800
    @total_payment = @total + @postage
  end
  
  def create
    @order =Order.new(order_params)
    @order.postage = 800
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to orders_thanx_path
    else
     render :new
    end  
  
    #カートから注文詳細へ移し替え
    carts = current_customer.carts.all
    carts.each do |cart|
      OrderDetail.create(
        order_id: @order.id,
        product_id: cart.product.id,
        quantity: cart.quantity,
        order_price: cart.product.add_tax_price
      )
    end
 
    carts.destroy_all #カートを空にする
  end
  
  def thanx
  end

  def index
    @orders = current_customer.orders
  end

  def show
    #@order = Order.find(params[:id])
    #@order_details = @order.order_details
  end

  private
    
    def order_params
      params.require(:order).permit(:name, :postal_code, :address, :total_payment, :payment_method)
    end
    
    def shopping_address_params
      params.require(:shopping_address).permit(:name, :postal_code, :address)
    end
  
end
