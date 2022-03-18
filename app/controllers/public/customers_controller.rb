class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def unsbscribe
  end

  def update
  end

  def withdraw
  end
end
