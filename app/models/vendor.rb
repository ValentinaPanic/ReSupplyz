class Vendor < ApplicationRecord
    has_secure_password

    has_many :products
    has_many :orders
    has_many :orders, through: :products

end
