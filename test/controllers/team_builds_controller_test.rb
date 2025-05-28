require "test_helper"

class TeamBuildsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get team_builds_search_url
    assert_response :success
  end
end
