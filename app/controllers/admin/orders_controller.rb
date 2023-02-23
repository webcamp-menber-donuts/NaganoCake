class Admin::OrdersController < ApplicationController
  def show #注文詳細履歴ページ
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @total_payment = 0
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    #注文ステータスの変更
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to request.referer
    else
      render "show"
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
