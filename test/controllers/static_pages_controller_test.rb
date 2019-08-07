require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home page" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get events page" do
    get static_pages_event_url
    assert_response :success
  end

  test "should get picture page" do
    get static_pages_picture_url
    assert_response :success
  end

  test "should get history page" do
    get static_pages_history_url
    assert_response :success
  end

  test "should get join page" do
    get static_pages_join_url
    assert_response :success
  end

  test "should get sale page" do
    get static_pages_sale_url
    assert_response :success
  end

  test "should get specs page" do
    get static_pages_specs_url
    assert_response :success
  end
end
