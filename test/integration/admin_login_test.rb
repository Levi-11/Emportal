require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
    def setup
        @user = admins(:michael)
    end
    
    test "Invalid Login" do
        get login_admin_url
        assert_template 'login/admin'
        post login_admin_path, params: { session: { username: "", password: "" } }
        assert_template 'login/admin'
        assert_not flash.empty?
        get root_path
        assert flash.empty?
    end
    test "login with valid information followed by logout" do
        get login_admin_url
        post login_admin_path, params: { session: { username:    @user.username,
                                            password: 'admin' } }
        assert is_logged_in?
        assert_redirected_to admin_dashboard_path
        follow_redirect!
        assert_template 'admin/dashboard'
        assert_select "a[href=?]", admin_dashboard_url, count: 0
        assert_select "a[href=?]", logout_path
        # assert_select "a[href=?]", user_path(@user)
        delete logout_path
        assert_not is_logged_in?
        assert_redirected_to root_url
        delete logout_path
        follow_redirect!
        assert_select "a[href=?]", login_admin_url
        assert_select "a[href=?]", logout_path,      count: 0
        # assert_select "a[href=?]", user_path(@user), count: 0
  end
end
