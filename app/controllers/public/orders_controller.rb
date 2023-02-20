class Public::OrdersController < ApplicationController
  
  def new
    #@order = Order.new 新規の注文idを取得
    #@order.customer_id = current_customer.id #customer_idを渡す
    #@shopping_addresses = shopping_addresses.where(customer: current_customer) #customerが持っている配送先を取り出し
    
    #if @order(order_params,shopping_addresses)
      #redirect_to orders_check_path(@order)
    #else
      #render 'new'
    #end
  end
  
  def check
    
    #カートを合計し請求額などを合計して
    #@postage = 800
    #@order.total_payment = 
    #@order.save
    
    #@carts = current_customer.carts
    #@carts.each do |cart|
      #OrderDetail.create(
        #order: @order
        #product: cart.product_id
        #product_status: 0
        #quantity: cart.quantity
        #order_price: @sub_price(cart))
    #end
    
    #render "thanx"
    #@cart_items.destroy_all カートを空にする
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
      params.require(:order).permit(:customer_id, :payment_method)
    end
    
    def shopping_addresses_params
      #お届け先追加のとき
    end
  
end
