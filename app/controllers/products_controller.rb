class ProductsController < ApplicationController
    
    def new
        @product = Product.new
    end

    def create
        # byebug
        @vendor = Vendor.find_by(id: session[:vendor_id])
        @product = @vendor.products.build(product_params)
       
        if @product.save
            redirect_to vendor_path(@vendor)
        else 
            render :new
        end
        # byebug
    end

    def edit
        @product = product.find_by(params[:id])
      end
    
    def update
        @product = product.find(params[:id])
        if @product.save
          @product.update(product_params)
          redirect_to product_path
        else
          redirect_to edit_product_path
        end
    end
    def show
        @product = product.find(params[:id])
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :category, :price, :vendor_d)
    end

end
