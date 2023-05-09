require "test_helper"

class Users::AcademicCalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_academic_calendars_index_url
    assert_response :success
  end
end
