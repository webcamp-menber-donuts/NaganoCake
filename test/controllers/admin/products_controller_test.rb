require "test_helper"

class Admin::Products　indexControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_products　index_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_products　index_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_products　index_edit_url
    assert_response :success
  end
end
