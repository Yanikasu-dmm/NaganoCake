class Public::CartsController < ApplicationController
  before_action :setup_cart_item, only: [:add_item, :delete_item, :show]
  
  def my_cart
    @cart_items = current_cart.cart_items.includes([:item])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
 
  def add_item
    @cart_item ||= current_cart.cart_items.build(item_id: params[:item_id])
    @cart_item.amount += params[:amount].to_i
    if  @cart_item.save
      flash[:notice] = '商品が追加されました。'
      redirect_to public_my_cart_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to public_item_path(params[:item_id])
    end
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
