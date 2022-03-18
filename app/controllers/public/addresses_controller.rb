class Public::AddressesController < ApplicationController
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
    redirect_to public_addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    @address = Adderss.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :post_code, :address, :name)
  end
end
