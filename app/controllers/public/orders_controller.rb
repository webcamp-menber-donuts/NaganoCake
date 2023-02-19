class Public::OrdersController < ApplicationController
  def new
    #@order = Order.new
    #@order.customer_id = current_customer.id
    #(カート合計や送り先のデータ不足)
    #if @order.save(order_params)
      #redirect_to orders_check_path(@order)
    #else
      #render 'new'
    #end
  end
  
  def check
    #カートを合計し請求額などを合計して
    #@order.save
    #render "thanx"
    
    #カートのデータをorder_idをつけて注文詳細に移動 each文
    #@cart_items.destroy_all カートを空にする
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
    #ひとまず支払い方法のチェック？？
  end
  
  def shopping_addresses_params
    #お届け先追加のとき
  end
  
  def order_check_params
    
  end
  
end
