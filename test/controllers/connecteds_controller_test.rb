require "test_helper"

class ConnectedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @connected = connected(:one)
  end

  test "should get index" do
    get connecteds_url, as: :json
    assert_response :success
  end

  test "should create connected" do
    assert_difference("Connected.count") do
      post connecteds_url, params: { connected: { connections: @connected.connections, user_info_id: @connected.user_info_id } }, as: :json
    end

    assert_response :created
  end

  test "should show connected" do
    get connected_url(@connected), as: :json
    assert_response :success
  end

  test "should update connected" do
    patch connected_url(@connected), params: { connected: { connections: @connected.connections, user_info_id: @connected.user_info_id } }, as: :json
    assert_response :success
  end

  test "should destroy connected" do
    assert_difference("Connected.count", -1) do
      delete connected_url(@connected), as: :json
    end

    assert_response :no_content
  end
end
