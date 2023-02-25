class Public::ProductsController < ApplicationController
  def new
  end

  def index
    @products = Product.page(params[:page])
    @product_genres = ProductGenre.all
  end

  def show
    @product_genres = ProductGenre.all
    @product = Product.find(params[:id])
    @cart = Cart.new
  end

end