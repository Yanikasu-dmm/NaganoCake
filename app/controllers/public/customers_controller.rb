class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def unsbscribe
  end

  def withdraw
  end
end
