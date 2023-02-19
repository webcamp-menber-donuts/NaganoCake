class Public::ProductsController < ApplicationController
  def new
  end
  
  def index
    @products = Product.all
  end

  def show
  end

end