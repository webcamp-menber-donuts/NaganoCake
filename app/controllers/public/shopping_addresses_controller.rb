class Public::ShoppingAddressesController < ApplicationController

  def index
    @shopping_address = ShoppingAddress.new
    shopping_addresses = ShoppingAddress.all
    @customer = current_customer
    @shopping_addresses = @customer.shopping_addresses
  end

  def create
    @shopping_address = ShoppingAddress.new(shopping_address_params)
    @shopping_address.customer_id = current_customer.id
    if @shopping_address.save
      redirect_to shopping_addresses_path
    else
      @shopping_addresses = ShoppingAddress.all
      render 'index'
    end
  end

  def edit
    @shopping_address = ShoppingAddress.find(params[:id])
  end

  def update
    @shopping_address = ShoppingAddress.find(params[:id])
     if @shopping_address.update(shopping_address_params)
       redirect_to shopping_addresses_path
     else
       render "edit"
     end
  end

  def destroy
    ShoppingAddress.find(params[:id]).destroy
    redirect_to shopping_addresses_path
  end

  private

  def shopping_address_params
    params.require(:shopping_address).permit(:name, :postal_code, :address)
  end
end