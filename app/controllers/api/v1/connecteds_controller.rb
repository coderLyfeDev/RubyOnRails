class ConnectedsController < ApplicationController
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

  # POST /connecteds
  def create
    @connected = Connected.new(connected_params)

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
      params.require(:connected).permit(:requested_date, :requestor, :user1, :user2)
    end
end
