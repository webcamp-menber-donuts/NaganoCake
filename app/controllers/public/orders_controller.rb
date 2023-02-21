class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    
    #if @order(order_params)
      #redirect_to orders_check_path(@order)
    #else
     # render 'new'
    #end
  end

  def check
    @order = Order.new(order_params)
    
    if params[:order][:address_number] == "1"
      @order.name = current_customer.full_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      
    elsif params[:order][:address_number] == "2"
      #if Address.exists?(name: params[:order][:shopping_addresses])
      @order.name = ShoppingAddress.find(params[:order][:registered]).name
      @order.postal_code = ShoppingAddress.find(params[:order][:registered]).postal_code
      @order.address = ShoppingAddress.find(params[:order][:registered]).address
     
    elsif params[:order][:address_number] == "3"
      shopping_addresses = current_customer.addresses.new(address_params)
      @order.name = :name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.addressす
    end
    
    #カートの計算
    @carts = current_customer.carts.all
    @total = @carts.inject(0) { |sum, item| sum + item.subtotal }
    @postage = 800
    @order.total_payment = @total + @postage
  end
  
  def create
    @order = current_customer.orders.new(order_params)
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
    #@orders = current_customer.orders
  end

  def show
    #@order = Order.find(params[:id])
    #@order_details = @order.order_details
  end

  private
    
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end
    
    #def shopping_addresses_params
      #params.require(:order).permit(:customer_id, :payment_method)
    #end
  
end
