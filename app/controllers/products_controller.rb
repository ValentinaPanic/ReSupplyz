class ProductsController < ApplicationController
    
    def index
        if params[:vendor_id]
            @vendor = Vendor.find(params[:vendor_id])
            @products = @vendor.products
        else
        #    @error = "That Vendor doesn't exists."
            @products = Product.all
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
        # byebug
    end

    def edit
        @product = Product.find(params[:id])
      end
    
    def update
        @product = Product.find(params[:id])
        redirect_to products_path if !@product || @product.vendor != current_vendor
        if  @product.update!(product_params)
            redirect_to product_path
         else
            render :edit
        end
    end
    def show
        @product = Product.find(params[:id])
    end

    private

    def product_params
       
        params.require(:product).permit(:name, :description, :category, :price, :vendor_id, order_ids: [] )
    end

end
