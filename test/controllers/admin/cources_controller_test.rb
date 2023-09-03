require "test_helper"

class Admin::CourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_cources_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_cources_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_cources_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_cources_show_url
    assert_response :success
  end
end
