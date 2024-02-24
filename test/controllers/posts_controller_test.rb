require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = post(:one)
  end

  test "should get index" do
    get posts_url, as: :json
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { comments: @post.comments, content: @post.content, likes: @post.likes, post_type: @post.post_type, scope: @post.scope, shares: @post.shares, tagged_users: @post.tagged_users, user_id: @post.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show post" do
    get post_url(@post), as: :json
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { comments: @post.comments, content: @post.content, likes: @post.likes, post_type: @post.post_type, scope: @post.scope, shares: @post.shares, tagged_users: @post.tagged_users, user_id: @post.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post), as: :json
    end

    assert_response :no_content
  end
end
