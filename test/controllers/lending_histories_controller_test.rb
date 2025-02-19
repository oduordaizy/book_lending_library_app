require "test_helper"

class LendingHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lending_histories_index_url
    assert_response :success
  end
end
