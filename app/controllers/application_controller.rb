class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    helper_method :current_user
    helper_method :logged_in?
  
    def logged_in?
      session.include?(:manager_id) || session.include?(:vendor_id)
    end
  
    def current_user
      byebug
      @current_user ||= User.find(session[:manager_id]) if session[:manager_id]
    end
end
