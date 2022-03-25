class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def show
    @customer = current_customer
  end

  def unsbscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
end
