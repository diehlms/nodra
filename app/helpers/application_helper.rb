module ApplicationHelper

    def full_title(page_title = '')
        base_title = "NODRA Sailing"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
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
