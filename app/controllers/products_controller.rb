class ProductsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:vendor_id] && @vendor = Vendor.find(params[:vendor_id])
            @products = @vendor.products.alpha
        else
            @error = "That product doesn't exists." 
            @products = Product.alpha
       
         end
    end

    def new
        @product = Product.new
    end

    def create
        # byebug
        @product = current_vendor.products.build(product_params)
       
        if @product.save
            redirect_to vendor_products_path(current_vendor)
        else 
            render :new
        end
    end

    def edit
    end
    
    def update
             redirect_to products_path if !@product || @product.vendor != current_vendor
        if  @product.update!(product_params)
            redirect_to product_path
         else
            render :edit
        end
    end
    def show
    end
    def destroy
        @product.destroy
        redirect_to manager_path(current_vendor)
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :category, :price, :vendor_id, order_ids: [] )
    end

    def set_product
        @product = Product.find(params[:id])
    end

end
