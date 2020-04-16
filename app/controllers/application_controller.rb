class ApplicationController < ActionController::Base
    
    helper_method :logged_in_user, :logged_in?

    def logged_in_user
        if session[:profile_id]
            @logged_in_user = Profile.find_by(id: session[:profile_id])
        end
    end

    def logged_in?
        !!logged_in_user
    end

end
