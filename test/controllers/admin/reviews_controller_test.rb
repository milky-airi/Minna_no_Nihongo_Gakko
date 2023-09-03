require "test_helper"

class Admin::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get individual" do
    get admin_reviews_individual_url
    assert_response :success
  end
end
