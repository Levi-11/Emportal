require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def setup
    @employee = Employee.new(name: "Nikhil D Anand", gender: "Male", designation: "Full Stack Developer", phone: 8592817590, email: "nikhildanand@gmail.com",date_of_join: Date.parse('2017-11-23'), address: "Sajith Nivas Karumalloor P.O, Thattampady, Aluva, Ernakulam", active: "False", username: "nikhildanand@gmail.com", personal_email: "nikhildanand@hotmail.com", date_of_birth: Date.parse('1994/03/17'), password: "holaa2", password_confirmation: "holaa2")
  end
  test "employee should be valid" do
    @employee.valid?
  end 
  test "name should be present" do
    @employee.name = " "
    assert_not @employee.valid?
  end
  test "name should not be empty" do
    @employee.name = ""
    assert_not @employee.valid?
  end
  test "designation should be present" do
    @employee.designation = " "
    assert_not @employee.valid?
  end
  test "designation should not be empty" do
    @employee.designation = ""
    assert_not @employee.valid?
  end
  test "email and username must not be empty" do
    @employee.email = @employee.username = ""
    assert_not @employee.valid?
  end
  test "email addresses should be unique" do
    duplicate_user = @employee.dup
    duplicate_user.email = @employee.email.upcase
    @employee.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @employee.email = mixed_case_email
    @employee.save
    assert_equal mixed_case_email.downcase, @employee.reload.email
  end
  test "date must be valid" do
    @employee.date_of_join = '2017-67-82'
    assert_not @employee.valid?
  end
  test "date must be present" do
    @employee.date_of_join = ''
    assert_not @employee.valid?
  end
  test "address must be present" do
    @employee.address = " "
    assert_not @employee.valid?
  end
  test "address must be valid" do
    @employee.address = ""
    assert_not @employee.valid?
  end
  test "password" do
    @employee.password = @employee.password_confirmation = " "
    assert_not @employee.valid?
  end
  test "password should not be too long" do
    @employee.password = @employee.password_confirmation = "a" * 16
    assert_not @employee.valid?
  end
  test "password should not be too short" do
    @employee.password = @employee.password_confirmation = "a" * 4
    assert_not @employee.valid?
  end
  test "Active" do
    @employee.active = "true"
    assert_not @employee.valid?
  end
end
