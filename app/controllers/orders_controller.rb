class OrdersController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    
    def index
        if current_manager && logged_in?
        @orders = current_manager.orders
        else
            redirect_to '/'
        end
    end
    def new

      @order = Order.new
        15.times do 
            @p_ord = @order.product_orders.build
            @p_ord.build_product

        end
    end

    def create
        # byebug
        @order = Order.create(order_params)
        @order.manager = current_manager
        if @order.save
            redirect_to order_path(@order)
        else 
        
            render :new
        end
    end    
    def edit
    end
    
    def update
      
         redirect_to manager_path(current_manager) if !@order || @order.manager != current_manager 
        if @order.update(order_params)
          redirect_to order_path(@order)
        
        else
          render :edit
        end
    end
    def show
    end
    def destroy
        @order.destroy
        redirect_to manager_path(current_manager)
    end
        
    private

    def order_params
        params.require(:order).permit(:delivery_date, :delivered, :manager_id, product_ids: [], product_order_ids: [], product_orders_attributes: [:quantity, :id, :product_id])
    end
    def set_order
        @order = Order.find(params[:id])
    end
end
