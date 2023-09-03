require "test_helper"

class Public::DetailSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get detail_search" do
    get public_detail_searches_detail_search_url
    assert_response :success
  end
end
