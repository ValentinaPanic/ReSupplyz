class ProductOrder < ApplicationRecord
  belongs_to :product_id
  belongs_to :order_id
end
