require "test_helper"

class Public::MaterialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_materials_index_url
    assert_response :success
  end

  test "should get show" do
    get public_materials_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_materials_edit_url
    assert_response :success
  end
end
