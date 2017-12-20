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
    @employee = Employee.find(params[:id])
  end

  def edit_employee
    redirect_to root_url unless logged_in?
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to admin_employee_details_url(:id => @employee.id)
    else
      render 'add_employee'
    end
  end

  def update
    @employee = Employee.find(params[:id])   
    if @employee.update_attributes(employee_updates)
      redirect_to admin_employee_url

      # Handle a successful update.
    else
      render admin_edit_employee_url
    end
  end

  def destroy
    Employee.find(params[:id]).destroy
    redirect_to admin_employee_url
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password,
                                 :password_confirmation, :gender, :designation, :date_of_join, :phone, :date_of_birth, :address, :active, :username)
  end

  private

  def employee_updates
    params.require(:employee).permit(:name, :designation, :phone, :address, :active)
  end
end
