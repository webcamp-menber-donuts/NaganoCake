class Admin::ProductGenresController < ApplicationController

  def index
    @genres = ProductGenre.all
    @genre = ProductGenre.new
  end

 def create
    @genre = ProductGenre.new(genre_params)
    if @genre.save
      redirect_to admin_product_genres_path, notice: "You have created product_genre successfully."
    else
      @genres = ProductGenre.all
      render 'index'
    end
 end

  def edit
    @genre = ProductGenre.find(params[:id])
  end

  def update
    @genre = ProductGenre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_product_genres_path, notice: "You have updated product_genre successfully."
    else
      render "edit"
    end
  end

 private

  def genre_params
    params.require(:product_genre).permit(:name)
  end
end