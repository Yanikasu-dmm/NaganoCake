class Public::OrdersController < ApplicationController

  def new
    @cart_items = CartItem.where(customer_id: current_customer)
    if @cart_items.empty?
      redirect_to items_path
    end
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.sum_of_price
    end
    @order = Order.new
    @full_address =
    '〒' + current_customer.post_code + ' ' + current_customer.address + ' ' + current_customer.last_name + current_customer.first_name
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).where.not(status: nil).order(created_at: "DESC")
    @order_details = OrderDetail.all
  end

  def complete
    @order = Order.find(params[:id])
  end

  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.find(params[:id])
    @order.status = "wating_payment"
    cart_items = CartItem.where(customer_id: current_customer.id)
    cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item = cart_item.item
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    if @order.save
      cart_items.destroy_all
      redirect_to action: :complete, id: @order.id
    else
      @order.destroy
      redirect_to cart_items_path
    end
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
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
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.total_price = 0
    @cart_items.each do |cart_item|
      @order.total_price += cart_item.item.get_tax_include_price * cart_item.amount
    end
   @order.save
   @full_address = '〒' + @order.post_code + ' ' + @order.address + ' ' + @order.name
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :post_code, :address, :name, :select_address, :address_id, :postage)
  end

end
