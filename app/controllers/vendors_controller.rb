class VendorsController < ApplicationController

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

    def edit
        @vendor = Vendor.find(params[:id])
      end
    
    def update
        @vendor = Vendor.find(params[:id])
        if @vendor.save
          @vendor.update(vendor_params)
          redirect_to vendor_path
        else
          redirect_to edit_vendor_path
        end
    end
    def show
        
        @vendor = Vendor.find(params[:id])
        
    end

    private
    def vendor_params
        params.require(:vendor).permit(:name, :rep_name, :email, :password)
    end
end
