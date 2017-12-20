require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
   test "Root truth" do
      get root_path
      assert_template 'login/home'
      assert_select "a[href=?]", login_admin_url
      assert_select "a[href=?]", login_employee_url
   end
   test "Admin truth" do
    get login_admin_url
    assert_template 'login/admin'
  end
end
