require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get notify_all" do
    get users_notify_all_url
    assert_response :success
  end
end
