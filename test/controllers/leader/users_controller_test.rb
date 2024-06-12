require "test_helper"

class Leader::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get leader_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get leader_users_edit_url
    assert_response :success
  end
end
