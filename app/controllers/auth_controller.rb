class AuthController < ApplicationController
    def google_callback
        p "start login"
        p request.env["omniauth.auth"]
        authentication_info = request.env["omniauth.auth"]
        p authentication_info
        cookies[:email] = authentication_info['info']['email']
        p cookies[:email]
        p session[:user_id]
        p session[:auth_redirect] #requested path
        if session[:auth_redirect] != nil
          redirect_to session[:auth_redirect]
        else
          redirect_to '/'
        end
    end
    def logout
        cookies[:email] = nil
        # cookies =nil
        # session.clear
        # reset_session
        
        redirect_to "https://accounts.google.com/logout"
    end
end

