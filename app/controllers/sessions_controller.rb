class SessionsController < ApplicationController

    def welcome
    end
    
    def new
      
    end
  
    def create
      # byebug
      if params[:manager_id]
        @manager = Manager.find_by(email: params[:email]) 
                 
          session[:manager_id] = @manager.id if !@manager.nil? && @manager.authenticate(params[:password])
          redirect_to manager_path(@manager)
        
      elsif params[:vendor_id]

         @vendor = Vendor.find_by(email: params[:email]) 
       
          session[:vendor_id] = @vendor.id if !@vendor.nil? && @vendor.authenticate(params[:password])
          redirect_to vendor_path(@vendor)
     
      else
        flash[:message] = "Credentials are incorect. Try again!"
         render 'sessions/new' 
      end
      # byebug
  end

    def destroy
      # byebug
      session.clear

      redirect_to root_path
    end
end
