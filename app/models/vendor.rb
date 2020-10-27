class Vendor < ApplicationRecord
    has_secure_password

    has_many :products
    has_many :orders
    has_many :orders, through: :products

    validates :name, :email, :password, :rep_name, presence: true
    validates :email, uniqueness: true

end
