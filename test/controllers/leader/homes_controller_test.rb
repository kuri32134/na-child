require "test_helper"

class Leader::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get leader_homes_top_url
    assert_response :success
  end
end
