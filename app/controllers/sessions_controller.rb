class SessionsController < ApplicationController

    def welcome
    end
    
    def new
    end
  
    def create
      @manager = Manager.find_by(email: params[:manager_email]) 
          
      if @manager
        session[:manager_id] = @manager.id
        redirect_to manager_path(@manager)
      else
        render 'sessions/new'
      end
    end

    def destroy
      session.clear

      redirect_to root_path
    end
end
