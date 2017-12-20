module LoginHelper
    def log_in(user)
        session[:username] = user.id
    end

    def remember(user)
        user.remember
        cookies.permanent.signed[:username] = user.id
        cookies.permanent[:remember_token] = user.remember_token
      end

    def current_user
        if (username = session[:username])
            @current_user ||= Admin.find_by(id: username)
          elsif (username = cookies.signed[:username])
            user = Admin.find_by(id: username)
            if user && user.authenticated?(cookies[:remember_token])
              log_in user
              @current_user = user
            end
        end
      end

      def forget(user)
        user.forget
        cookies.delete(:username)
        cookies.delete(:remember_token)
      end
    
    def logged_in?
        !current_user.nil?
      end
    def log_out
        forget(current_user)
        session.delete(:username)
        @current_user = nil
    end
end
