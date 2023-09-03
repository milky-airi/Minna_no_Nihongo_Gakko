require "test_helper"

class Public::SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_schools_index_url
    assert_response :success
  end

  test "should get show" do
    get public_schools_show_url
    assert_response :success
  end
end
