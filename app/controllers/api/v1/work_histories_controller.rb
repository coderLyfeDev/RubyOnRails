class Api::V1::WorkHistoriesController < ApplicationController
  before_action :set_work_history, only: %i[ show update destroy ]

  # GET /work_histories
  def index
    @work_histories = WorkHistory.all

    render json: @work_histories
  end

  # GET /work_histories/1
  def show
    render json: @work_history
  end

     # GET /work_histories/get_by_user
     def get_by_user
      user_id = params[:user_id]
      @work_history = WorkHistory.where(user_info_id: user_id)
  
      render json: @work_history
    end

  # POST /work_histories
  def create
    @work_history = WorkHistory.new(work_history_params)

    if @work_history.save
      render json: @work_history, status: :created, location: api_v1_work_history_url(@work_history)
    else
      render json: @work_history.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_histories/1
  def update
    if @work_history.update(work_history_params)
      render json: @work_history
    else
      render json: @work_history.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_histories/1
  def destroy
    @work_history.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_history
      @work_history = WorkHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_history_params
      params.require(:work_history).permit(:id, :current_position, :employer_name, :end_date, :location, :position, :start_date, :user_info_id)
    end
end
