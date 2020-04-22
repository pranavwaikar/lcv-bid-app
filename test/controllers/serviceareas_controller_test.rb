require 'test_helper'

class ServiceareasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get serviceareas_index_url
    assert_response :success
  end

  test "should get new" do
    get serviceareas_new_url
    assert_response :success
  end

  test "should get create" do
    get serviceareas_create_url
    assert_response :success
  end

  test "should get update" do
    get serviceareas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get serviceareas_destroy_url
    assert_response :success
  end

end
