class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = Customer.find(params[:id])
  end

  def unsbscribe
  end

  def withdraw
  end
end
