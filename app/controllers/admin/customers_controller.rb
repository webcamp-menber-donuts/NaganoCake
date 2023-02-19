class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id), notice: "情報を更新しました"
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :fast_name, :kana_last_name, :kana_fast_name, :postal_code, :address, :telephone_number, :email)
  end
end
