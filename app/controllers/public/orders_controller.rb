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
      @order = ShoppingAddresses.new(shopping_address_params)
      @order.name = :name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    end
    
    #カートの計算
    @carts = current_customer.carts.all
    @total = @carts.inject(0) { |sum, item| sum + item.subtotal }
    @postage = 800
    @total_payment = @total + @postage
  end
  
  def create
    @postage = 800
    @order =Order.new(order_params)
    if @order.save
      
    else
      render :new
    end  
  
    #カートから注文詳細へ移し替え
    carts = current_customer.carts.all
    carts.each do |cart|
      OrderDetail.create(
        order_id: @order.id,
        product_id: cart.product_id,
        quantity: cart.quantity,
        order_price: cart.sub_price
      )
    end
 
    carts.destroy_all #カートを空にする
    render "thanx"
  end
  
  def thanx
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
    
    def order_params
      params.require(:order).permit(:name, :postal_code, :address, :total_payment, :payment_method)
    end
    
    def shopping_address_params
    params.require(:shopping_address).permit(:name, :postal_code, :address)
  end
  
end
