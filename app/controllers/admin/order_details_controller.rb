class Admin::OrderDetailsController < ApplicationController
    def update
        @order_detail = OrderDetail.find(params[:id]) #遷移先のurlの/:id/を持つorder_detailを1件取得
        @order = Order.find(@order_detail.order_id)   #注文のidが注文詳細のorder_idと一致しているものを取得
        @order_details = @order.order_details.all     #注文が複数持っている注文詳細を全て取得
        
        #製作ステータスの変更
          #製作ステータス１つでも[制作中]に更新すると、注文ステータスが[制作中]に更新される
          #製作ステータスを"全て"[製作完了]に更新すると,注文ステータスが[発送準備中]に更新される
        is_updated = true
        if @order_detail.update(order_detail_params)
          @order.update(order_status: 2) if @order_detail.product_status == "in_production"
          
          @order_details.each do |order_detail|
            if order_detail.product_status != "production_complete"
              is_updated = false
            end
          end
          @order.update(order_status: 3) if is_updated
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
