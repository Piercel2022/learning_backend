require "test_helper"

class Api::QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_quizzes_index_url
    assert_response :success
  end

  test "should get show" do
    get api_quizzes_show_url
    assert_response :success
  end

  test "should get create" do
    get api_quizzes_create_url
    assert_response :success
  end

  test "should get submit" do
    get api_quizzes_submit_url
    assert_response :success
  end
end
