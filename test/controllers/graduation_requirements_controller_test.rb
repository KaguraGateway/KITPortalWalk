require "test_helper"

class GraduationRequirementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get graduation_requirements_index_url
    assert_response :success
  end

  test "should get new" do
    get graduation_requirements_new_url
    assert_response :success
  end
end
