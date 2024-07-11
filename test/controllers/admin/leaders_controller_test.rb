require "test_helper"

class Admin::LeadersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_leaders_index_url
    assert_response :success
  end
end
