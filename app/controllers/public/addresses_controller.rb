class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @new_address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @new_address = Address.new(address_params)
    @new_address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Adderss.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.permit(:customer_id, :post_code, :address_code, :name)
  end
end
