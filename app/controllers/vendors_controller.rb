class VendorsController < ApplicationController

    def index
        @vendors = Vendor.all
       
    end
    def new
        @vendor = Vendor.new
    end
    def create
        @vendor = Vendor.new(vendor_params)
       
        if @vendor.save
            session[:vendor_id] = @vendor.id

            redirect_to vendor_path(@vendor)
        else 
            render :new
        
        end
    end
    def show
        if logged_in?
          @vendor = Vendor.find(params[:id])
            
        else
          redirect_to root_path
        end
    end

    private
    def vendor_params
        params.require(:vendor).permit(:name, :rep_name, :email, :password)
    end
end
