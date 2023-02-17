class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
     t.integer :product_status, null: false, default: "0"
     t.integer :quantity, null: false
     t.integer :order_price, null: false
      t.timestamps
    end
  end
end