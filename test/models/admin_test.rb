require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @user = Admin.new(username: "admin", password:"admin", password_confirmation: "admin")
  end
  test "the truth" do
    assert @user.valid?
  end
  test "username" do
    @user.username = " "
    assert_not @user.valid?
  end
  test "password" do
    @user.password = @user.password_confirmation = " "
    assert_not @user.valid?
  end
  test "name should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end
  test "password should not be too long" do
    @user.password = @user.password_confirmation = "a" * 16
    assert_not @user.valid?
  end
  test "password should not be too short" do
    @user.password = @user.password_confirmation = "a" * 4
    assert_not @user.valid?
  end
  test "Have no duplicates" do
    dup = @user.dup
    @user.save
   assert_not dup.valid?
  end
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

end
