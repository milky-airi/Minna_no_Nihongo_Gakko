require "test_helper"

class Admin::AlertsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_alerts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_alerts_show_url
    assert_response :success
  end
end
