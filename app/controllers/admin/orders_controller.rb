class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.where.not(status: nil).order(created_at: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:order][:status]
    @order.save
    @order_details = OrderDetail.where(order_id: @order.id)
    if @order.status == "wating_payment"
      @order_details.each do |order_detail|
        order_detail.product_status = "wating_product"
        order_detail.save
      end
    end
    redirect_to admin_order_path(@order.id)
  end
end
