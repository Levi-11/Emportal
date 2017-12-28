class EmployeeController < ApplicationController
  def dashboard
    redirect_to root_url unless emplogged_in?
    @employee = empcurrent_user
    #@employee = Employee.find(params[:id])
  end
  def update
    @employee = Employee.find(params[:id])
  
    if @employee.update_attributes(employee_params_with_pic)
    # Handle a successful update.
      redirect_to employee_dashboard_url
    else
      
     render employee_details_path
    end
  end
  def details
    @employee = empcurrent_user
  end

  private

  def employee_params_with_pic
    params.require(:employee).permit( :phone, :personal_email, :address, :picture)
  end
end
