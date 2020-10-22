class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    helper_method :current_manager
    helper_method :current_vendor
    helper_method :logged_in?
  
    def logged_in?
      session.include?(:manager_id) || session.include?(:vendor_id)
    end
  
    def current_manager
     
      @current_manager ||= Manager.find(session[:manager_id]) if session[:manager_id]
    end
    def current_vendor
     
      @current_vendor ||= Vendor.find(session[:vendor_id]) if session[:vendor_id]
    end
end
