class EmployeeController < ApplicationController
  def dashboard
    redirect_to root_url unless emplogged_in?
    @employee = empcurrent_user
    #@employee = Employee.find(params[:id])
  end
  def update
    @employee = Employee.find(params[:id])
  
    if ((params[:employee][:phone]).blank? ? true : @employee.update_attribute(:phone, params[:employee][:phone]) ) && ((params[:employee][:personal_email]).blank? ? true : @employee.update_attribute(:personal_email, params[:employee][:personal_email]) ) && ((params[:employee][:address]).blank? ? true : @employee.update_attribute(:address, params[:employee][:address]) )    
      # Handle a successful update.
      redirect_to employee_dashboard_url
    else
      
     render employee_details_path
    end
  end
  def details
    @employee = empcurrent_user
  end
end
