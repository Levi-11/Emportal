require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admin_dashboard_url
    assert_response :success
  end

  test "should get employee" do
    get admin_employee_url
    assert_response :success
  end

  test "should get add_employee" do
    get admin_add_employee_url
    assert_response :success
  end

  test "should get employee_details" do
    get admin_employee_details_url
    assert_response :success
  end

  test "should get employee_projects" do
    get admin_project_url
    assert_response :success
  end

  test "should get edit_employee" do
    get admin_edit_employee_url
    assert_response :success
  end
end
