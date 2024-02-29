class Api::V1::CareersController < ApplicationController
  before_action :set_career, only: %i[ show update destroy ]

  # GET /careers
  def index
    @careers = Career.all

    render json: @careers
  end

  # GET /careers/1
  def show
    render json: @career
  end

  # POST /careers
  def create
    @career = Career.new(career_params)

    if @career.save
      render json: @career, status: :created, location: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /careers/1
  def update
    if @career.update(career_params)
      render json: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # DELETE /careers/1
  def destroy
    @career.destroy!
  end


  #Get not Interest careers
  def careers_not_interested
    userId = params[:userId]

    careers_not_interested = Career.left_joins(:career_interests)
                                   .where('career_interest.career_id IS NULL OR career_interest.user_info_id != ?', userId)
                                   .select('career.*')

    render json: careers_not_interested
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
      @career = Career.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def career_params
      params.require(:career).permit(:category, :salary_range, :sub_category)
    end
end
