require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get withdrawal_check" do
    get public_customers_withdrawal_check_url
    assert_response :success
  end
end
