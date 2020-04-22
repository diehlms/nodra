class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    
    def login!
        session[:user_id] = @user.id
    end

    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                session[:user_id] = user.id
                @current_user = user
            end
        end
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger] = 'You must be logged in'
            redirect_to root_path
        end
    end
end
