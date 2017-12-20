class EmployeeController < ApplicationController
  def dashboard
    redirect_to root_url unless emplogged_in?
    @employee = empcurrent_user
    #@employee = Employee.find(params[:id])
  end

  def details
  end
end
