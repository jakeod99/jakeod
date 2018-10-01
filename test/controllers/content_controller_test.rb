require 'test_helper'

class ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get projects" do
    get content_projects_url
    assert_response :success
  end

  test "should get employment" do
    get content_employment_url
    assert_response :success
  end

  test "should get resume" do
    get content_resume_url
    assert_response :success
  end

end
