class Product < ApplicationRecord
    belongs_to :vendor
    has_many :product_orders
    has_many :orders, through: :product_orders
     
    scope :alpha, -> { order(:name) }
    # scope :per_vendors, -> { Product.joins(:vendor).group('vendors.id').order('products.name') }
    # def self.alpha
    #     order(:name)
    # end
end
