class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def product_attributes=(attributes)
    self.product = Product.find_or_create_by(attributes) if attributes.values.any?(&:empty?)
  end
end
