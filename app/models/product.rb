class Product < ApplicationRecord
    belongs_to :vendor
    has_many :product_orders
    has_many :orders, through: :product_orders
     
    validates :name, :price, :category, presence: true
    validates :name, uniqueness: true
    
    scope :alpha, -> { order(:name) }
    
    
    
    # def self.alpha
    #     order(:name)
    # end
  
end
