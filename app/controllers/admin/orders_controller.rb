class Admin::OrdersController < Admin::ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:order][:status]
    @order.save
    redirect_to admin_order_path(@order.id)
  end
end
