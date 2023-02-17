require "test_helper"

class Public::ShoppingAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shopping_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_shopping_addresses_edit_url
    assert_response :success
  end
end
