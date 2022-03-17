class Public::CartItemsController < ApplicationController
  before_action :setup_item, only:[:destroy]

  def destroy
    @setup_item.destroy
    redirect_to current_cart
  end

  
  private setup_item
  
  def setup_item
    @setup_item = CartItem.find([params[:id]])
  end

end
