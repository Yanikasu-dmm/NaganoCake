class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def unsbscribe
  end

  def update
    @customer = Costomer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(customer.id)
  end

  def withdraw
  end
end
