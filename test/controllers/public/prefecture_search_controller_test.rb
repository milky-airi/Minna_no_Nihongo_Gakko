require "test_helper"

class Public::PrefectureSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get prefecture_search" do
    get public_prefecture_search_prefecture_search_url
    assert_response :success
  end
end
