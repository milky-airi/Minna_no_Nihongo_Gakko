require "test_helper"

class Admin::SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_schools_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_schools_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_schools_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_schools_show_url
    assert_response :success
  end
end
