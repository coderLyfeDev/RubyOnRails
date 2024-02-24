require "test_helper"

class CareersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @career = career(:one)
  end

  test "should get index" do
    get careers_url, as: :json
    assert_response :success
  end

  test "should create career" do
    assert_difference("Career.count") do
      post careers_url, params: { career: { category: @career.category, salary_range: @career.salary_range, sub_category: @career.sub_category } }, as: :json
    end

    assert_response :created
  end

  test "should show career" do
    get career_url(@career), as: :json
    assert_response :success
  end

  test "should update career" do
    patch career_url(@career), params: { career: { category: @career.category, salary_range: @career.salary_range, sub_category: @career.sub_category } }, as: :json
    assert_response :success
  end

  test "should destroy career" do
    assert_difference("Career.count", -1) do
      delete career_url(@career), as: :json
    end

    assert_response :no_content
  end
end
