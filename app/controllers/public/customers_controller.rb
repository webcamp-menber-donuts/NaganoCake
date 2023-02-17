class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer.id
  end

  def edit
  end

  def withdrawal_check
  end
end
