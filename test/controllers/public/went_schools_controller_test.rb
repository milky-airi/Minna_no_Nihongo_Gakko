require "test_helper"

class Public::WentSchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_went_schools_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_went_schools_edit_url
    assert_response :success
  end
end
