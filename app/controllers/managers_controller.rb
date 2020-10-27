class ManagersController < ApplicationController

    def index
        @managers = Manager.all
    end
    def new
        @manager = Manager.new
    end
    def create
        @manager = Manager.new(manager_params)
       
        if @manager.save
            session[:manager_id] = @manager.id

            redirect_to manager_path(@manager)
        else 
            render :new
        
        end
    end

    def show
        if logged_in?
             @manager = Manager.find(params[:id])
        else
             redirect_to root_path
        end
    end

    private
    def manager_params
        params.require(:manager).permit(:name, :email, :password, :company_name)
    end
end


