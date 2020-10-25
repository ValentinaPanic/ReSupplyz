class OrdersController < ApplicationController
    
    def index
        @orders = Order.all    
        products = Product.all
    end
    def new

      @order = Order.new
        4.times do 
            @p_ord = @order.product_orders.build
            @p_ord.build_product

        end
    end

    def create
        # byebug
        @order = Order.create(order_params)
        @order.manager = current_manager
        if @order.save!
            redirect_to order_path(@order)
        else 
        
            render :new
        end
    end    

    def show
        @order = Order.find(params[:id])
    end
        
        private
    def order_params
        # byebug
        params.require(:order).permit(:delivery_date, :delivered, :manager_id, product_ids: [], product_order_ids: [], product_orders_attributes:[:quantity, :product_id])
    end
end
