class AddProductGenreIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :product_genre_id, :integer
  end
end
