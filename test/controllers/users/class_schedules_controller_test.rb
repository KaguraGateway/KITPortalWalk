require "test_helper"

class Users::ClassSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_class_schedules_index_url
    assert_response :success
  end
end
