class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
     if  @product.save
       redirect_to admin_product_path(@product)
     else
       render :new
     end
  end

  def index
   @products = Product.all
  end

  def show
   @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
     if @product.update(product_params)
       redirect_to admin_product_path(@product), notice: "You have updated product_genre successfully."
     else
       render "edit"
     end
  end

private

  def product_params
    params.require(:product).permit(:name, :introduction, :price, :is_sale, :image, :product_genre_id)
  end

end
