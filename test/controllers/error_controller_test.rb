require 'test_helper'

class ErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get construction" do
    get error_construction_url
    assert_response :success
  end

end
