class SessionsController < ApplicationController

    def welcome
      @products = Product.all
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
        flash[:message] = "Credentials are incorrect. Try again!"
        render 'sessions/new' 
      end
  end

    def destroy
      session.clear
      redirect_to root_path
    end
    def google
      
      @manager = Manager.find_or_create_by(email: auth["info"]["email"]) do |manager|
        manager.name = auth["info"]["name"]
        manager.password = SecureRandom.hex(10)
      end
      if @manager.save!
        session[:manager_id] = @manager.id
        redirect_to manager_path(@manager)
      else
        redirect_to '/'
      end
    end
  private

  def auth
    request.env['omniauth.auth']
  end

end
