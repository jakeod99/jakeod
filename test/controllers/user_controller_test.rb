require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_register_url
    assert_response :success
  end

end
