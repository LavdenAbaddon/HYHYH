require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get create_room" do
    get new_room_path
    assert_response :success
  end
  
=begin

  test "should get video_room" do
    get static_pages_video_room_url
    assert_response :success
  end
  
  test "should get chatroom" do
    get chatroom_path
    assert_response :success
  end
=end

end
