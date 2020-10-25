class OrdersController < ApplicationController
    
    def index
        @orders = Order.all    
        products = Product.all
    end
    def new

      @order = Order.new
        4.times do 
            pr_order = @order.product_orders.build
            pr_order.build_product

        end
       
    end

    def create
        #  byebug
        @order = Order.new(order_params)
       
        if @order.save
            redirect_to order_path(@order)
        else 
        
            render :new
        end
        
    end

    def order_params
        params.require(:order).permit(:delivery_date, :delivered, :manager_id, product_ids: [], product_orders_attributes: [:quantity, :product_id, product_attributes: [:name]])
    end
end
