class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @new_address = Address.new
    @addresses = Address.where(customer: current_customer)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @new_address = Address.new(address_params)
    if @new_address.save
      redirect_to addresses_path
    else
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :post_code, :address_code, :name)
  end
end
