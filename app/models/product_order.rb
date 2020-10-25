class ProductOrder < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true

  def product_attributes=(attributes)
   
    self.product = Product.find_or_create_by(attributes) if !attributes[:name].empty?
  #  byebug
  end
end
