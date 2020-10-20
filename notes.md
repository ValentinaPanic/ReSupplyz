*User Model
    has_many :orders
    has_many :vendors
    has_many :vendors, through: :orders
    has_many :items

*Product Model
    belongs_to :vendors
    belongs_to :users
    belongs_to :orders


*Vendor Model
    has_many :users
    has_many :users, through: :orders
    has_many :products
    has_many :orders
    has_many :orders, through: :items

*Order Model
    has_many :items
    belongs_to :vendors
    belongs_to :user

