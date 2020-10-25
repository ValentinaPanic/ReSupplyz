class ProductOrdersController < ApplicationController

    def new
    @product_order = ProductOrder.new
    end
       
    
    def create
byebug
        @product_order = ProductOrder.create(order_id: params[:order_id], product_id:  params[:product_id], quantity: params[:quantity])
       
         redirect_to manager_order_path(@product_order.order.manager)
       
    end

end
