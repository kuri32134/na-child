require "test_helper"

class Leader::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leader_posts_new_url
    assert_response :success
  end

  test "should get index" do
    get leader_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get leader_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get leader_posts_edit_url
    assert_response :success
  end
end
