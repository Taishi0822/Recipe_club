require "test_helper"

class Admin::CooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cooks_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_cooks_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_cooks_edit_url
    assert_response :success
  end
end
