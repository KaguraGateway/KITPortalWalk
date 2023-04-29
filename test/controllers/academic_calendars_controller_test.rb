require "test_helper"

class AcademicCalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get academic_calendars_new_url
    assert_response :success
  end
end
