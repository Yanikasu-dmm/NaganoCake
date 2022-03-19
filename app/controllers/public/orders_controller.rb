class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def complete
  end

  def show
  end

  def create

  end

  def confirm
    postage = 10
    @order = Order.new(order_params)
    @order.postage = postage
    if params[:order][:select_address] == "0"
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.post_code = current_customer.post_code
    elsif params[:order][:select_address] == "1"
      @order_address = Address.find(params[:order][:address_id])
      @order.address = @order_address.address_code
      @order.post_code = @order_address.post_code
      @order.name = @order_address.name
    else
      @order.address = params[:order][:address]
      @order.post_code = params[:order][:post_code]
      @order.name = params[:order][:name]
    end

    @order.save
    cart_items = CartItem.where(customer_id == current_customer.id)
    cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    @order_details = OrderDetail.all
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :post_code, :address, :name, :select_address, :address_id, :status)
  end
end
