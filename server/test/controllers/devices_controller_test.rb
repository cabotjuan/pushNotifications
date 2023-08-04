require "test_helper"

class DevicesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get devices_create_url
    assert_response :success
  end
end
