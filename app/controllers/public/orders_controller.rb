class Public::OrdersController < ApplicationController
  def new
  end

  def index
  end

  def complete
  end

  def show
  end

  def create
  end

  def comfirm
    @order = Order.new(order_params)
    if parms[:order][:select_address] == 0
      @order.address = current_user.address
    elsif parms[:order][:select_address] == 1
      @order.address.id = params[:address_id]
    else
      @order.address = params[:new_address]
    end

    @order.save
    binding.pry
  end


  private
  
  def order_params
    params.require(:order).permit(:payment_method, :select_address, :address_id, :post_code, :address, :name)
  end
end
