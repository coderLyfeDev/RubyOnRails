class Api::V1::ConnectedsController < ApplicationController
  before_action :set_connected, only: %i[ show update destroy ]

  # GET /connecteds
  def index
    @connecteds = Connected.all

    render json: @connecteds
  end

  # GET /connecteds/1
  def show
    render json: @connected
  end

  def get_by_user
    user_info_id_param = params[:user_info_id]
  
    if user_info_id_param.present?
      @connected = Connected.find_by(user_info_id: user_info_id_param)
      render json: @connected
    else
      render json: @connected.errors, status: :unprocessable_entity
    end
  end

  # POST /connecteds
  def create
    user_info_id = params[:user_info_id]
    conn_id = params[:conn_id]
    if user_info_id.present? && conn_id.present?
      @user_info = Connected.find_by(user_info_id: user_info_id)
      @conn_id = Connected.find_by(user_info_id: conn_id)
      
      if @user_info.nil?
        puts "Creating new user"
        @user_info = Connected.new(user_info_id: user_info_id, connections: conn_id.to_s)
      else
        puts "Updating user connections"
        @user_info.connections +=","+conn_id.to_s
      end
      if @conn_id.nil?
        puts "Creating new user"
        @conn_id = Connected.new(user_info_id: conn_id, connections: user_info_id.to_s)
      else
        puts "Updating user connections"
        @conn_id.connections +=","+user_info_id.to_s
      end
    end
    if @user_info.save && @conn_id.save
      render json: { user_info: @connected_user_info, conn_info: @connected_conn_id }, status: :created
    else
      render json: @user_info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /connecteds/1
  def update
    if @connected.update(connected_params)
      render json: @connected
    else
      render json: @connected.errors, status: :unprocessable_entity
    end
  end

  # DELETE /connecteds/1
  def destroy
    @connected.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connected
      @connected = Connected.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def connected_params
      params.require(:connected).permit(:connections, :user_info_id, conn_id)
    end
end
