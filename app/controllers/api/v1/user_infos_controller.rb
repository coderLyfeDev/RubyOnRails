class Api::V1::UserInfosController < ApplicationController
  before_action :set_user_info, only: %i[ show update destroy ]

  # GET /user_infos
  def index
    @user_infos = UserInfo.all

    render json: @user_infos
  end

  # GET /user_infos/1
  def show
    render json: @user_info
  end

  # POST /user_infos
  def create
    email = params[:email]
  
    @user_info = UserInfo.find_by(email: email)
  
    if @user_info.nil?
      # User doesn't exist, create a new one
      puts "Creating a new user..."
      @user_info = UserInfo.new(user_info_params)
  
      if @user_info.save
        profile_picture_url = @user_info.profile_picture.attached? ? url_for(@user_info.profile_picture) : nil
        render json: { user_info: { user_id: @user_info.id, profile_picture: profile_picture_url }, message: 'User created successfully' }, status: :created
      else
        render json: { error: 'Failed to create user', details: @user_info.errors.full_messages }, status: :unprocessable_entity
      end
    else
      puts "User already exists..."
      render json: { message: 'User already exists' }
    end
  end
  

  def login
    user_info_params = params.require(:user_info).permit(:email, :password)
    email = user_info_params[:email]
    password = user_info_params[:password]

    user = UserInfo.select(:id, :name, :email, :password).find_by(email: email)

    if user && user.password == password
      user_data = {
      user_id: user.id,
      name: user.name,
      email: user.email
    }

    # Add profile picture URL if it exists
    if user.profile_picture.attached?
      user_data[:profile_picture] = rails_blob_path(user.profile_picture, only_path: true)
    end
      render json: { message: 'Login successful', user: user_data }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end


  # PATCH/PUT /user_infos/1
  def update
    if @user_info.update(user_info_params)
      if params[:profile_picture].present?
        @user_info.profile_picture.attach(params[:profile_picture])
      end
        profile_picture_url = @user_info.profile_picture.attached? ? url_for(@user_info.profile_picture) : nil
        render json: { user_info: { user_id: @user_info.id, profile_picture: profile_picture_url }, message: 'User updated successfully' }
    else
      render json: @user_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_infos/1
  def destroy
    @user_info.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_info
      @user_info = UserInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_info_params
      params.require(:user_info).permit(:id, :name, :email, :password, :profile_picture, :role)
    end
end
