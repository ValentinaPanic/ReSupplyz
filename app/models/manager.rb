class Manager < ApplicationRecord
    has_secure_password

    has_many :orders
    has_many :products, through: :orders

    validates :name, :email, presence: true
    validates :email, uniqueness: true
  
    
    
end
