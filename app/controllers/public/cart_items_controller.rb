class Public::CartItemsController < ApplicationController

  def create
    cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_item = CartItem.new(cart_item_params)
    cart_items.each do |cart_item|
      if @cart_item.item_id == cart_item.item_id
        @cart_item = cart_item
        @cart_item.amount += params[:cart_item][:amount].to_i
      end
    end
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price * cart_item.amount
    end
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
