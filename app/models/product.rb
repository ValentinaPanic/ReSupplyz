class Product < ApplicationRecord
    belongs_to :vendor
    has_many :product_orders
    has_many :orders, through: :product_orders
     
    validates :name, :price, :category, presence: true
    validates :name, uniqueness: true
    
    scope :alpha, -> { order(:name) }
    
    scope :expensive_products, -> { where("price > 20")}
    
    # def self.alpha
    #     order(:name)
    # end
  
    # def self.expensive_products
    #     where("price > 20").order(:name)
    # end
end
