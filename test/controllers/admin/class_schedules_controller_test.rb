require "test_helper"

class Admin::ClassSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_class_schedules_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_class_schedules_new_url
    assert_response :success
  end
end
