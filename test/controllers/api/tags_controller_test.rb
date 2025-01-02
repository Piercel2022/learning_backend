require "test_helper"

class Api::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_tags_index_url
    assert_response :success
  end
end
