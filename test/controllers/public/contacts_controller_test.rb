require "test_helper"

class Public::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_contacts_new_url
    assert_response :success
  end

  test "should get done" do
    get public_contacts_done_url
    assert_response :success
  end
end
