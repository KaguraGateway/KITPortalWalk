require "test_helper"

class Admin::SemesterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_semester_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_semester_new_url
    assert_response :success
  end
end
