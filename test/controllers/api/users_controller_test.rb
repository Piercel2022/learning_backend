require "test_helper"

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_users_create_url
    assert_response :success
  end

  test "should get login" do
    get api_users_login_url
    assert_response :success
  end

  test "should get show" do
    get api_users_show_url
    assert_response :success
  end
end
