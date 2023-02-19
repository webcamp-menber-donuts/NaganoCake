class Public::ProductsController < ApplicationController
  def new
  end
  
  def index
    @products = Product.all
    @product_genres = ProductGenre.all
  end

  def show
    @product_genres = ProductGenre.all
    @product = Product.find(params[:id])
  end

end