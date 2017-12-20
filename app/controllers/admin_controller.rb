class AdminController < ApplicationController
  def dashboard
    redirect_to root_url unless logged_in?
  end

  def show
    redirect_to root_url unless logged_in?
    @user = Admin.find(params[:id])
  end

  def employee
  end

  def add_employee
    redirect_to root_url unless logged_in?
    @employee = Employee.new
  end

  def employee_details
    redirect_to root_url unless logged_in?
    @empdet = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to admin_employee_details_url(:id => @employee.id)
    else
      render 'add_employee'
    end
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :password,
                                 :password_confirmation, :gender, :designation, :date_of_join, :phone, :date_of_birth, :address, :active, :username)
  end
end
