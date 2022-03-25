class Admin::OrderDetailsController < Admin::ApplicationController

 def update
  @order_detail = OrderDetail.find(params[:id])
  @order = Order.find(@order_detail.order_id)
  @order_detail.product_status = params[:order_detail][:product_status]
  @order_detail.save
  @order_details = OrderDetail.where(order_id: @order.id)
  if @order_details.exists?(product_status: "producting")
   @order.status = "producting"
  elsif @order_details.where(product_status: ["wating_product", "cannot_product", "producting"]).empty?
   @order.status = "preparation"
  end
  @order.save
  redirect_to admin_order_path(@order.id)
 end

 private
end
