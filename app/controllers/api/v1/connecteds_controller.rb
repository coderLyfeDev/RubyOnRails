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
      puts "-----------------------------------------------"
      puts user_info_id_param
      puts @connected
    end
  end

  # POST /connecteds
  def create
    user_info_id_param = params[:user_info]

    if user_info_id_param.present?
      connections = Connected.get_connections(user_info_id_param)
      puts "-----------------------------------------------"
      puts user_info_id_param
      puts connections
    #@connected = Connected.new(connected_params)
    end
    if @connected.save
      render json: @connected, status: :created, location: @connected
    else
      render json: @connected.errors, status: :unprocessable_entity
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
      params.require(:connected).permit(:connections, :user_info_id)
    end
end
