class Order < ApplicationRecord
    
    has_many :product_orders
    has_many :products, through: :product_orders
    belongs_to :manager
    accepts_nested_attributes_for :product_orders


    # def product_orders_attributes=(attributes)
      
    #     attributes.values.each do |v|
    #         if !v[:quantity].empty?
    #             self.product_orders << ProductOrder.create(v)
    #         end
    #     end
    # #    byebug
    # end  

    def delivery
        self.delivery_date.strftime("%b %d, %Y")
    end
 
end
