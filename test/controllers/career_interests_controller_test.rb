require "test_helper"

class CareerInterestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @career_interest = career_interest(:one)
  end

  test "should get index" do
    get career_interests_url, as: :json
    assert_response :success
  end

  test "should create career_interest" do
    assert_difference("CareerInterest.count") do
      post career_interests_url, params: { career_interest: { career_id: @career_interest.career_id, user_id: @career_interest.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show career_interest" do
    get career_interest_url(@career_interest), as: :json
    assert_response :success
  end

  test "should update career_interest" do
    patch career_interest_url(@career_interest), params: { career_interest: { career_id: @career_interest.career_id, user_id: @career_interest.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy career_interest" do
    assert_difference("CareerInterest.count", -1) do
      delete career_interest_url(@career_interest), as: :json
    end

    assert_response :no_content
  end
end
