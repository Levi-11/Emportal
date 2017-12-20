require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get admin" do
    get login_admin_url
    assert_response :success
  end

  test "should get employee" do
    get login_employee_url
    assert_response :success
  end

end
