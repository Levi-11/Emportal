class LoginController < ApplicationController
  def home
  end

  def admin
  end

  def employee
  end

  def create
    admin = Admin.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      # render 'admin/dashboard'
      log_in admin
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      
      redirect_to admin_dashboard_path

    
    else
      render 'login/admin'
      flash.now[:danger] = 'Invalid email/password combination'
    end
  end

  def destroy
    log_out if logged_in?
    
    redirect_to root_url
  end
end
