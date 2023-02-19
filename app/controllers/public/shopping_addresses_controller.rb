class Public::ShoppingAddressesController < ApplicationController
  def index
    @shopping_addresses = ShoppingAddress.all
    @shopping_address = ShoppingAddress.new
  end

  def edit
  end

  private

  def shopping_address_params
    params.require(:shopping_address).permit(:name, :postal_code, :address)
  end
end