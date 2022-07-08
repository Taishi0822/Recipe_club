require "test_helper"

class Public::CooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cooks_index_url
    assert_response :success
  end

  test "should get show" do
    get public_cooks_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_cooks_edit_url
    assert_response :success
  end
end
