require "test_helper"

class Public::AlertsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_alerts_new_url
    assert_response :success
  end

  test "should get thanks" do
    get public_alerts_thanks_url
    assert_response :success
  end
end
