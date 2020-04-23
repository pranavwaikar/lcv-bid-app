require 'test_helper'

class FindersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get finders_index_url
    assert_response :success
  end

end
