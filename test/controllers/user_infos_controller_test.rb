require "test_helper"

class UserInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_info = user_info(:one)
  end

  test "should get index" do
    get user_infos_url, as: :json
    assert_response :success
  end

  test "should create user_info" do
    assert_difference("UserInfo.count") do
      post user_infos_url, params: { user_info: { email: @user_info.email, name: @user_info.name, password: @user_info.password, profile_picture: @user_info.profile_picture, role: @user_info.role } }, as: :json
    end

    assert_response :created
  end

  test "should show user_info" do
    get user_info_url(@user_info), as: :json
    assert_response :success
  end

  test "should update user_info" do
    patch user_info_url(@user_info), params: { user_info: { email: @user_info.email, name: @user_info.name, password: @user_info.password, profile_picture: @user_info.profile_picture, role: @user_info.role } }, as: :json
    assert_response :success
  end

  test "should destroy user_info" do
    assert_difference("UserInfo.count", -1) do
      delete user_info_url(@user_info), as: :json
    end

    assert_response :no_content
  end
end
