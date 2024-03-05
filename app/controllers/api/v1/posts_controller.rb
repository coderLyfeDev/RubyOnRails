class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  def get_by_user
    connections = params[:connections]
    puts "---------Getting newsfeed-------------"
    if connections.present?
      connections_array = connections.split(',').map(&:to_i)
      @post = Post.includes(user_info: { profile_picture_attachment: :blob }).where("user_info_id IN (?)", connections_array).to_a
      postContext = @post.map do |p|
        profile_picture_url = p.user_info.profile_picture.attached? ? url_for(p.user_info.profile_picture) : nil
        {
          post_id: p.id,
          user_info_id: p.user_info.id,
          user_name: p.user_info.name,
          user_email: p.user_info.email,
          user_profile_picture: profile_picture_url,
          post_content: p.content,
          post_time: p.created_at,
          post_likes: p.likes,
          post_comments: p.comments,
          post_shares: p.shares,
        }
      end
      render json: postContext
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end
  

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:likes, :shares, :comments, :content, :scope, :post_type, :tagged_users, :user_info_id, :connections)
    end
end
