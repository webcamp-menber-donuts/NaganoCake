class AddCustomerIdToShoppingAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_addresses, :customer_id, :integer
  end
end
