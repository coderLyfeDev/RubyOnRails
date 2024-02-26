class Api::V1::CareerInterestsController < ApplicationController
  before_action :set_career_interest, only: %i[ show update destroy ]

  # GET /career_interests
  def index
    @career_interests = CareerInterest.all

    render json: @career_interests
  end

  # GET /career_interests/1
  def show
    render json: @career_interest
  end

   # GET /career_interest/get_by_user
   def get_by_user
    user_id = params[:user_id]
    @career_interest = CareerInterest.where(user_id: user_id)
    careers_info = @career_interest.map do |interest|
      {
        career_id: interest.career_id,
        sub_category: interest.career.sub_category,
        category: interest.career.category,
      }
    end

    render json: careers_info
  end

  # POST /career_interests
  def create
    @career_interest = CareerInterest.new(career_interest_params)

    if @career_interest.save
      render json: @career_interest, status: :created, location: api_v1_career_interests_url(@career_interest)
    else
      render json: @career_interest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /career_interests/1
  def update
    if @career_interest.update(career_interest_params)
      render json: @career_interest
    else
      render json: @career_interest.errors, status: :unprocessable_entity
    end
  end

  #DELETE /career_interests/1
  def destroy
    @career_interest.destroy!
  end

  def delete_by_user_and_career
    user_id = params[:user_id]
    career_id = params[:career_id]

    # Find and destroy the CareerInterest based on user_id and career_id
    @career_interest = CareerInterest.find_by(user_id: user_id, career_id: career_id)
    
    if @career_interest
      @career_interest.destroy!
      head :no_content
    else
      render json: { error: 'CareerInterest not found' }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career_interest
      @career_interest = CareerInterest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def career_interest_params
      params.require(:career_interest).permit(:id, :career_id, :user_id)
    end
end
