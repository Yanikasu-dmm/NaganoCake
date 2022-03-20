class Admin::OrderDetailsController < Admin::ApplicationController

 def update
  @order_detail = OrderDetail.find(params[:id])
  @order = Order.find(@order_detail.order_id)
  @order_detail.product_status = params[:order_detail][:product_status]
  @order_detail.save
  redirect_to admin_order_path(@order.id)
 end

 private 
end
