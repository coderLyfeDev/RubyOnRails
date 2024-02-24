class Api::V1::EducationsController < ApplicationController
  before_action :set_education, only: %i[ show update destroy ]
  #for cross-site origin

  # GET /educations
  def index
    @educations = Education.all

    render json: @educations
  end

  # GET /educations/1
  def show
    render json: @education
  end

  # POST /educations
  def create
    @education = Education.new(education_params)
    puts "Hello, world!"
    if @education.save
      render json: @education, status: :created, location: api_v1_education_url(@education)
    else
      render json: @education.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /educations/1
  def update
    if @education.update(education_params)
      render json: @education, status: :ok, location: api_v1_education_url(@education)
    else
      render json: @education.errors, status: :unprocessable_entity 
    end
  end

  # DELETE /educations/1
  def destroy
    @education.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def education_params
      params.require(:education).permit(:id, :degree, :graduated, :highest_degree, :school_name, :state, :user_id)
    end
end
