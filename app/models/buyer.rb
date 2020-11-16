class Buyer < User
    has_many :carts
    has_many :products, through: :carts

    has_many :favourites
    has_many :products, through: :favourites
end
