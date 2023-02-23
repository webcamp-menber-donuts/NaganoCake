class Admin::OrderDetailsController < ApplicationController
    def update
        @order_detail = OrderDetail.find(params[:id])
        #製作ステータスの変更
        if @order_detail.update(order_detail_params)
          flash[:notice] = "製作ステータスを更新しました"
          redirect_to request.referer
        else
          render template: "orders/show"
        end
    end
    
  private

  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
end
