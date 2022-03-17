class Public::CartsController < ApplicationController
  before_action :setup_cart_item, only: [:add_item, :delete_item, :show]
  
  def my_cart
    @cart_items = current_cart.cart_items.includes([:item])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
 
  def add_item
    if CartItem.find_by(product_id: params[:product_id], cart_id: current_cart.id).blank?
      @cart_item = current_cart.cart_items.create(product_id: params[:product_id])
    end
    
    @cart_item.quantity += params[:product][:quantity].to_i
    @cart_item.save!
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item
    @cart_item = CartItem.find_by(cart_id: current_cart.id,item_id: params[:item_id])
  end
end
