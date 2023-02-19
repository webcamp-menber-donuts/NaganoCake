class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update!(customer_params)
      redirect_to customers_my_page_path
    else
      render "edit"
    end
  end

  def withdrawal_check
    # @customer = current_customer
    # if @customer.update(is_deleted: true)
    #   reset_session
    #   flash[:notice] = "ながのCAKEを退会しました"
    #   redirect_to "/"
    # end
  end
  
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :fast_name, :kana_last_name, :kana_fast_name, :postal_code, :address, :telephone_number, :email)
  end
end
