class Order < ApplicationRecord
    
    has_many :product_orders
    has_many :products, through: :product_orders
    belongs_to :manager

    def product_orders_attributes=(attributes)
        attributes.values.each do |v|
            if !v[:quantity].empty?
                self.product_orders << ProductOrder.create(v)
            end
        end
    end
end
