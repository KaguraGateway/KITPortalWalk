require "test_helper"

class Users::UserSubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_user_subjects_index_url
    assert_response :success
  end

  test "should get new" do
    get users_user_subjects_new_url
    assert_response :success
  end

  test "should get create" do
    get users_user_subjects_create_url
    assert_response :success
  end

  test "should get edit" do
    get users_user_subjects_edit_url
    assert_response :success
  end
end
