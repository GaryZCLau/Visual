class LoginsController < ApplicationController
      def loginform
        @errors = flash[:errors]
      end
    
      def handle_login
        @profile = Profile.find_by(fullname: params[:fullname])
        if @profile && @profile.authenticate(params[:password])
          session[:profile_id] = @profile.id
          redirect_to @profile
        else
          flash[:error] = "Invalid username or password"
          redirect_to login_login_path
        end
      end

      def logout
        session[:profile_id] = nil
        redirect_to profiles_path
      end
end