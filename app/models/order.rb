class Order < ApplicationRecord
    
    has_many :product_orders
    has_many :products, through: :product_orders
    belongs_to :manager

    accepts_nested_attributes_for :product_orders
    validates :delivery_date, presence: true

    scope :pending, -> { where(delivered: false)}
  
    def delivery
        self.delivery_date.strftime("%b %d, %Y")
    end

    def delivery_status
        if self.delivered
            "Delivered"
        else
            "Pending"
        end
    end
 
end
