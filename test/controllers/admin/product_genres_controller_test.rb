require "test_helper"

class Admin::ProductGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_product_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_product_genres_edit_url
    assert_response :success
  end
end
