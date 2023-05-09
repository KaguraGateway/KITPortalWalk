require "test_helper"

class Admin::BuildingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_buildings_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_buildings_new_url
    assert_response :success
  end
end
