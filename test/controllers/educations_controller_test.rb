require "test_helper"

class EducationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @education = education(:one)
  end

  test "should get index" do
    get educations_url, as: :json
    assert_response :success
  end

  test "should create education" do
    assert_difference("Education.count") do
      post educations_url, params: { education: { degree: @education.degree, graduated: @education.graduated, highest_degree: @education.highest_degree, school_name: @education.school_name, state: @education.state, user_id: @education.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show education" do
    get education_url(@education), as: :json
    assert_response :success
  end

  test "should update education" do
    patch education_url(@education), params: { education: { degree: @education.degree, graduated: @education.graduated, highest_degree: @education.highest_degree, school_name: @education.school_name, state: @education.state, user_id: @education.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy education" do
    assert_difference("Education.count", -1) do
      delete education_url(@education), as: :json
    end

    assert_response :no_content
  end
end
