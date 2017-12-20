require 'test_helper'

class EmployeeControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get employee_dashboard_url
    assert_response :success
  end

  test "should get details" do
    get employee_details_url
    assert_response :success
  end

end
