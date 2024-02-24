require "test_helper"

class WorkHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_history = work_history(:one)
  end

  test "should get index" do
    get work_histories_url, as: :json
    assert_response :success
  end

  test "should create work_history" do
    assert_difference("WorkHistory.count") do
      post work_histories_url, params: { work_history: { current_position: @work_history.current_position, employer_name: @work_history.employer_name, end_date: @work_history.end_date, location: @work_history.location, position: @work_history.position, start_date: @work_history.start_date, user_id: @work_history.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show work_history" do
    get work_history_url(@work_history), as: :json
    assert_response :success
  end

  test "should update work_history" do
    patch work_history_url(@work_history), params: { work_history: { current_position: @work_history.current_position, employer_name: @work_history.employer_name, end_date: @work_history.end_date, location: @work_history.location, position: @work_history.position, start_date: @work_history.start_date, user_id: @work_history.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy work_history" do
    assert_difference("WorkHistory.count", -1) do
      delete work_history_url(@work_history), as: :json
    end

    assert_response :no_content
  end
end
