require "test_helper"

class Admin::DetailSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get detail_search" do
    get admin_detail_searches_detail_search_url
    assert_response :success
  end
end
