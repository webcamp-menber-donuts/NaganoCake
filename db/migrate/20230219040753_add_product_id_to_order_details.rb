class AddProductIdToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :product_id, :integer
  end
end
